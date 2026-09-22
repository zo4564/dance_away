class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = Lesson.find(params[:lesson_id])

    if @lesson.booked_places >= @lesson.capacity
      redirect_to @lesson, alert: t(".full")
      return
    end

    booking = Booking.new(
      student: current_user,
      lesson: @lesson
    )

    if booking.save
      redirect_to @lesson, notice: t(".success")
    else
      redirect_to @lesson, alert: t(".already_booked")
    end
  end
end