# frozen_string_literal: true

require "rails_helper"

RSpec.describe DanceStyle, type: :model do
  describe "associations" do
    it "has many dance_classes" do
      style = create(:dance_style)
      dance_class = create(:dance_class, dance_style: style)

      expect(style.dance_classes).to contain_exactly(dance_class)
    end
  end
end