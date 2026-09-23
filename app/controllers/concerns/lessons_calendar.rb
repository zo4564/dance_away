module LessonsCalendar
  extend ActiveSupport::Concern

  private

  def selected_week
    if params[:week].present?
      Date.parse(params[:week]).beginning_of_week
    else
      Date.current.beginning_of_week
    end
  rescue Date::Error, TypeError
    Date.current.beginning_of_week
  end

  def prepare_calendar(lessons)
    @week_start = selected_week

    week_end = @week_start.end_of_week.end_of_day

    @calendar_lessons = lessons
                          .where(
                            starts_at: @week_start.beginning_of_day..week_end
                          )
                          .order(:starts_at)

    @week_days = (0..6).map do |day|
      @week_start + day.days
    end

    @lessons_by_day = @calendar_lessons.group_by do |lesson|
      lesson.starts_at.to_date
    end
  end
end