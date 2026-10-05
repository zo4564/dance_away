class LessonsController < ApplicationController
  include LessonsCalendar

  def index
    @view = params[:view].presence_in(%w[list calendar]) || "list"

    @lessons = Lesson
                 .includes(:teacher, dance_class: :dance_style)
                 .order(:starts_at)

    prepare_calendar(@lessons)
  end

  def show
    @lesson = Lesson
                .includes(
                  :teacher,
                  :teacher_applications,
                  dance_class: :dance_style
                )
                .find(params[:id])
  end
end
