class TeacherApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_teacher!
  before_action :set_lesson

  def create
    if @lesson.teacher.present?
      redirect_to @lesson,
                  alert: "To zajęcia mają już przypisanego nauczyciela."
      return
    end

    application = @lesson.teacher_applications.new(
      teacher: current_user,
      status: "pending"
    )

    if application.save
      redirect_to @lesson,
                  notice: "Zgłoszenie zostało wysłane do administratora."
    else
      redirect_to @lesson,
                  alert: application.errors.full_messages.to_sentence
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def require_teacher!
    return if current_user.teacher?

    redirect_to root_path,
                alert: "Ta funkcja jest dostępna tylko dla nauczycieli."
  end
end