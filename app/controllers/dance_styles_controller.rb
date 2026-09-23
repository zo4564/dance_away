class DanceStylesController < ApplicationController
  include LessonsCalendar

  def index
    @dance_styles = DanceStyle
                      .includes(:dance_classes)
                      .order(:name)
  end

  def show
    @dance_style = DanceStyle.find(params[:id])

    @view = params[:view].presence_in(%w[list calendar]) || "list"

    @lessons = Lesson
                 .where(dance_class: @dance_style.dance_classes)
                 .includes(:teacher, dance_class: :dance_style)
                 .order(:starts_at)

    prepare_calendar(@lessons)
  end
end