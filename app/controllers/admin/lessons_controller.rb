class Admin::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :set_lesson, only: %i[
    edit
    update
    destroy
    participants
    change_teacher
  ]

  def index
    @lessons = Lesson
                 .includes(
                   :teacher,
                   :bookings,
                   dance_class: :dance_style,
                   teacher_applications: :teacher
                 )
                 .order(:starts_at)
  end

  def new
    @lesson = Lesson.new
    load_form_data
  end

  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to admin_lessons_path,
                  notice: "Zajęcia zostały utworzone."
    else
      load_form_data
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    load_form_data
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to admin_lessons_path,
                  notice: "Zajęcia zostały zaktualizowane."
    else
      load_form_data
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson.destroy

    redirect_to admin_lessons_path,
                notice: "Zajęcia zostały usunięte."
  end

  def participants
    @bookings = @lesson
                  .bookings
                  .includes(:student)
                  .order(created_at: :asc)
  end

  def change_teacher
    teacher_id = params.dig(:lesson, :teacher_id)

    if teacher_id.blank?
      redirect_to admin_lessons_path,
                  alert: "Wybierz nauczyciela."
      return
    end

    application = @lesson.teacher_applications
                         .where(status: %w[pending accepted])
                         .find_by(teacher_id: teacher_id)

    unless application
      redirect_to admin_lessons_path,
                  alert: "Ten nauczyciel nie zgłosił się do tych zajęć."
      return
    end

    @lesson.update!(teacher: application.teacher)

    application.update!(status: "accepted")

    redirect_to admin_lessons_path,
                notice: "Prowadzący został zmieniony."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to admin_lessons_path,
                alert: e.record.errors.full_messages.to_sentence
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def load_form_data
    @dance_classes = DanceClass
                       .includes(:dance_style)
                       .order(:name)

    @teachers = User
                  .joins(:roles)
                  .where(roles: { name: "teacher" })
                  .distinct
                  .order(:last_name, :first_name)
  end

  def lesson_params
    params.require(:lesson).permit(
      :dance_class_id,
      :teacher_id,
      :starts_at,
      :capacity
    )
  end

  def require_admin!
    return if current_user.admin?

    redirect_to root_path,
                alert: "Brak uprawnień."
  end
end