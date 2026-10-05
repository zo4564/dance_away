class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :set_user, only: %i[edit update destroy]

  def index
    @roles = Role.order(:name)

    @users = User
               .includes(:roles)
               .order(:last_name, :first_name)

    if params[:role].present?
      @users = @users
                 .joins(:roles)
                 .where(roles: { name: params[:role] })
                 .distinct
    end
  end

  def new
    @user = User.new
    load_roles
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path,
                  notice: "Użytkownik został utworzony."
    else
      load_roles
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    load_roles
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path,
                  notice: "Użytkownik został zaktualizowany."
    else
      load_roles
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user == current_user
      redirect_to admin_users_path,
                  alert: "Nie możesz usunąć własnego konta."
      return
    end

    @user.destroy

    redirect_to admin_users_path,
                notice: "Użytkownik został usunięty."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def load_roles
    @roles = Role.order(:name)
  end

  def user_params
    permitted = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      role_ids: []
    )

    if permitted[:password].blank?
      permitted.delete(:password)
      permitted.delete(:password_confirmation)
    end

    permitted
  end

  def require_admin!
    return if current_user.admin?

    redirect_to root_path,
                alert: "Brak uprawnień."
  end
end
