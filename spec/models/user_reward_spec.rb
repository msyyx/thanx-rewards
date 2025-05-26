require "rails_helper"

RSpec.describe UserReward, type: :model do
  context "create" do
    it "successfully creates with params" do
      reward = Reward.create!(name: "ThanxReward", status: "Available", reward_points_required: 1)
      user = User.create!(username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 1000)
      user_reward = UserReward.create!(user: user, reward: reward)
      expect(user_reward.user.id).to eq(user.id)
      expect(user_reward.reward.id).to eq(reward.id)
    end
  end
end