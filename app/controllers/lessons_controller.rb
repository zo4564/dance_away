# frozen_string_literal: true

class LessonsController < ApplicationController
  def index
    @lessons = Lesson.includes(:dance_class, :teacher).order(:starts_at)
  end

  def show
    @lesson = Lesson.includes(:dance_class, :teacher).find(params[:id])
  end
end