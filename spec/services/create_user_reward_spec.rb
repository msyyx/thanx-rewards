require "rails_helper"

RSpec.describe CreateUserReward, type: :model do
  describe "#perform" do
    it "updates user balance and creates user reward" do
      user = User.create!(username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 1000)
      reward = Reward.create!(name: "ThanxReward", status: "Available", reward_points_required: 200)
      CreateUserReward.new(user, reward).perform

      expect(user.reload.reward_points).to eq(800)
      expect(UserReward.last.user.id).to eq(user.id)
    end
  end
end