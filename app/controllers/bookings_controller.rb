class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson

  def create
    booking = nil

    @lesson.with_lock do
      if @lesson.available_places <= 0
        redirect_to @lesson, alert: t(".full")
        return
      end

      booking = Booking.new(
        student: current_user,
        lesson: @lesson
      )

      unless booking.save
        if booking.errors.added?(:base, :booking_conflict)
          redirect_to @lesson, alert: t("errors.messages.booking_conflict")
        else
          redirect_to @lesson, alert: t(".already_booked")
        end

        return
      end
    end

    redirect_to @lesson, notice: t(".success")
  end

  def destroy
    booking = @lesson.bookings.find_by(student: current_user)

    if booking
      booking.destroy
      redirect_to @lesson, notice: t(".destroy.success")
    else
      redirect_to @lesson, alert: t(".destroy.not_found")
    end
  end

  private

  def set_lesson
    @lesson = Lesson.includes(:dance_class, :teacher).find(params[:lesson_id])
  end
end
