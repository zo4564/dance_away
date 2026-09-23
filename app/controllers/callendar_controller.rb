class CallendarController < ApplicationController
  before_action :authenticate_user!

  def show
    @week_start = selected_week

    @lessons =
      lessons_for_current_user
        .includes(:teacher, dance_class: :dance_style)
        .where(
          starts_at: @week_start.beginning_of_day..
            @week_start.end_of_week.end_of_day
        )
        .order(:starts_at)

    @lessons_by_day = @lessons.group_by do |lesson|
      lesson.starts_at.to_date
    end
  end

  private

  def lessons_for_current_user
    if current_user.teacher?
      current_user.teaching_lessons
    else
      current_user.booked_lessons
    end
  end

  def selected_week
    if params[:week].present?
      Date.parse(params[:week]).beginning_of_week
    else
      Date.current.beginning_of_week
    end
  rescue Date::Error, TypeError
    Date.current.beginning_of_week
  end
end