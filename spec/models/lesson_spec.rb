require "rails_helper"

RSpec.describe Lesson, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      expect(build(:lesson)).to be_valid
    end

    it "requires starts_at" do
      lesson = build(:lesson, starts_at: nil)

      expect(lesson).not_to be_valid
    end

    it "requires capacity" do
      lesson = build(:lesson, capacity: nil)

      expect(lesson).not_to be_valid
    end

    it "requires capacity to be greater than zero" do
      expect(build(:lesson, capacity: 0)).not_to be_valid
      expect(build(:lesson, capacity: -1)).not_to be_valid
    end

    it "requires capacity to be an integer" do
      lesson = build(:lesson, capacity: 10.5)

      expect(lesson).not_to be_valid
    end
  end

  describe "#ends_at" do
    it "returns two hours after starts_at" do
      starts_at = Time.zone.parse("2026-09-23 18:00")
      lesson = build(:lesson, starts_at: starts_at)

      expect(lesson.ends_at).to eq(
                                  Time.zone.parse("2026-09-23 20:00")
                                )
    end

    describe "teacher" do
      it "can be unassigned" do
        lesson = build(:lesson, teacher: nil)

        expect(lesson).to be_valid
      end
    end
  end

  describe "#booked_places" do
    it "returns the number of bookings" do
      lesson = create(:lesson)

      create(:booking, lesson: lesson)
      create(:booking, lesson: lesson)

      expect(lesson.booked_places).to eq(2)
    end
  end

  describe "#available_places" do
    it "returns remaining capacity" do
      lesson = create(:lesson, capacity: 10)

      create(:booking, lesson: lesson)
      create(:booking, lesson: lesson)
      create(:booking, lesson: lesson)

      expect(lesson.available_places).to eq(7)
    end

    it "returns zero when the lesson is full" do
      lesson = create(:lesson, capacity: 2)

      create(:booking, lesson: lesson)
      create(:booking, lesson: lesson)

      expect(lesson.available_places).to eq(0)
    end
  end

  describe "#booked_by?" do
    it "returns true when the user has a booking" do
      lesson = create(:lesson)
      student = create(:user)
      create(:booking, lesson: lesson, student: student)

      expect(lesson.booked_by?(student)).to be(true)
    end

    it "returns false when the user has no booking" do
      lesson = create(:lesson)
      student = create(:user)

      expect(lesson.booked_by?(student)).to be(false)
    end
  end
end
