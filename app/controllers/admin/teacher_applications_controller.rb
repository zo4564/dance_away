class Admin::TeacherApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :set_application, only: %i[accept reject]

  def index
    @applications = TeacherApplication
                      .includes(
                        :teacher,
                        lesson: {
                          dance_class: :dance_style
                        }
                      )
                      .where(status: "pending")
                      .order(created_at: :asc)
  end

  def accept
    lesson = @application.lesson

    if lesson.teacher.present?
      redirect_to admin_teacher_applications_path,
                  alert: "Te zajęcia mają już przypisanego nauczyciela."
      return
    end

    lesson.update!(teacher: @application.teacher)
    @application.update!(status: "accepted")

    redirect_to admin_teacher_applications_path,
                notice: "Nauczyciel został przypisany do zajęć."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to admin_teacher_applications_path,
                alert: e.record.errors.full_messages.to_sentence
  end

  def reject
    @application.update!(status: "rejected")

    redirect_to admin_teacher_applications_path,
                notice: "Zgłoszenie zostało odrzucone."
  end

  private

  def set_application
    @application = TeacherApplication.find(params[:id])
  end

  def require_admin!
    return if current_user.admin?

    redirect_to root_path,
                alert: "Brak uprawnień."
  end
end