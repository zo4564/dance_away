class TeachersController < ApplicationController
  include LessonsCalendar

  def index
    @teachers = User
                  .joins(:roles)
                  .where(roles: { name: "teacher" })
                  .distinct
                  .order(:last_name, :first_name)
  end

  def show
    @teacher = User
                 .joins(:roles)
                 .where(roles: { name: "teacher" })
                 .find(params[:id])

    @view = params[:view].presence_in(%w[list calendar]) || "list"

    @lessons = @teacher
                 .teaching_lessons
                 .includes(:teacher, dance_class: :dance_style)
                 .order(:starts_at)

    prepare_calendar(@lessons)
  end
end
