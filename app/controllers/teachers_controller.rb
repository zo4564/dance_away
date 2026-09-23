class TeachersController < ApplicationController
  include LessonsCalendar

  def index
    @teachers = User
                  .where(role: "teacher")
                  .order(:last_name, :first_name)
  end

  def show
    @teacher = User.find_by!(
      id: params[:id],
      role: "teacher"
    )

    @view = params[:view].presence_in(%w[list calendar]) || "list"

    @lessons = @teacher
                 .teaching_lessons
                 .includes(:teacher, dance_class: :dance_style)
                 .order(:starts_at)

    prepare_calendar(@lessons)
  end
end