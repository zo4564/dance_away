# frozen_string_literal: true

require "rails_helper"

RSpec.describe DanceClass, type: :model do
  describe "associations" do
    it "belongs to a dance_style" do
      dance_style = create(:dance_style)
      dance_class = create(:dance_class, dance_style: dance_style)

      expect(dance_class.dance_style).to eq(dance_style)
    end

    it "has many lessons" do
      dance_class = create(:dance_class)
      lesson = create(:lesson, dance_class: dance_class)

      expect(dance_class.lessons).to contain_exactly(lesson)
    end
  end
end
