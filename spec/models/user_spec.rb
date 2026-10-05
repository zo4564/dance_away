# frozen_string_literal: true

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
  end

  describe "roles" do
    it "can have a student role" do
      user = create(:user, :student)

      expect(user.student?).to be(true)
      expect(user.has_role?("student")).to be(true)
    end

    it "can have a teacher role" do
      user = create(:user, :teacher)

      expect(user.teacher?).to be(true)
      expect(user.has_role?("teacher")).to be(true)
    end

    it "can have an admin role" do
      user = create(:user, :admin)

      expect(user.admin?).to be(true)
      expect(user.has_role?("admin")).to be(true)
    end

    it "can have multiple roles" do
      user = create(:user, :student)

      user.roles << Role.find_or_create_by!(name: "teacher")

      expect(user.student?).to be(true)
      expect(user.teacher?).to be(true)
    end

    it "returns false when the user does not have a role" do
      user = create(:user)

      expect(user.admin?).to be(false)
      expect(user.teacher?).to be(false)
    end
  end
end
