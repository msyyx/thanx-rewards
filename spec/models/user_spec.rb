require "rails_helper"

RSpec.describe User, type: :model do
  context "create" do
    it "successfully creates with params" do
      user = User.create!(username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 1)
      expect(user.username).to eq("Thanx")
      expect(user.reward_points).to eq(1)
    end

    it "cannot have negative balance" do
      expect { User.create!(username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end