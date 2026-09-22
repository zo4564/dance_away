require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      expect(build(:user)).to be_valid
    end

    it "requires first_name" do
      user = build(:user, first_name: nil)

      expect(user).not_to be_valid
    end

    it "requires last_name" do
      user = build(:user, last_name: nil)

      expect(user).not_to be_valid
    end

    it "requires a valid role" do
      user = build(:user, role: "admin")

      expect(user).not_to be_valid
    end

    it "accepts student role" do
      expect(build(:user, role: "student")).to be_valid
    end

    it "accepts teacher role" do
      expect(build(:user, role: "teacher")).to be_valid
    end
  end
end