class CalendarController < ApplicationController
  include LessonsCalendar

  before_action :authenticate_user!

  def show
    @view = params[:view].presence_in(%w[list calendar]) || "calendar"

    @lessons = lessons_for_current_user
                 .includes(:teacher, dance_class: :dance_style)
                 .order(:starts_at)

    prepare_calendar(@lessons)
  end

  private

  def lessons_for_current_user
    if current_user.teacher?
      current_user.teaching_lessons
    else
      current_user.booked_lessons
    end
  end
end
