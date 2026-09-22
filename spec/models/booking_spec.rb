# frozen_string_literal: true

require "rails_helper"

RSpec.describe Booking, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      expect(build(:booking)).to be_valid
    end

    it "does not allow the same student to book the same lesson twice" do
      student = create(:user)
      lesson = create(:lesson)

      create(:booking, student: student, lesson: lesson)

      duplicate_booking = build(
        :booking,
        student: student,
        lesson: lesson
      )

      expect(duplicate_booking).not_to be_valid
    end

    it "does not allow overlapping lessons for the same student" do
      student = create(:user)

      first_lesson = create(
        :lesson,
        starts_at: Time.zone.parse("2026-09-23 18:00")
      )

      second_lesson = create(
        :lesson,
        starts_at: Time.zone.parse("2026-09-23 19:00")
      )

      create(
        :booking,
        student: student,
        lesson: first_lesson
      )

      conflicting_booking = build(
        :booking,
        student: student,
        lesson: second_lesson
      )

      expect(conflicting_booking).not_to be_valid
    end

    it "allows lessons that start exactly when another lesson ends" do
      student = create(:user)

      first_lesson = create(
        :lesson,
        starts_at: Time.zone.parse("2026-09-23 18:00")
      )

      second_lesson = create(
        :lesson,
        starts_at: Time.zone.parse("2026-09-23 20:00")
      )

      create(
        :booking,
        student: student,
        lesson: first_lesson
      )

      next_booking = build(
        :booking,
        student: student,
        lesson: second_lesson
      )

      expect(next_booking).to be_valid
    end

    it "detects an overlap when the second lesson starts before the first one ends" do
      student = create(:user)

      first_lesson = create(
        :lesson,
        starts_at: Time.zone.parse("2026-09-23 18:00")
      )

      second_lesson = create(
        :lesson,
        starts_at: Time.zone.parse("2026-09-23 19:59")
      )

      create(
        :booking,
        student: student,
        lesson: first_lesson
      )

      conflicting_booking = build(
        :booking,
        student: student,
        lesson: second_lesson
      )

      expect(conflicting_booking).not_to be_valid
    end
  end
end