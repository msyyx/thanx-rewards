require "rails_helper"

RSpec.describe Reward, type: :model do
  context "create" do
    it "successfully creates with params" do
      reward = Reward.create!(name: "ThanxReward", status: "Available", reward_points_required: 1)
      expect(reward.name).to eq("ThanxReward")
      expect(reward.status).to eq("available")
      expect(reward.reward_points_required).to eq(1)
    end

    it "cannot have negative reward points required" do
      expect { Reward.create!(name: "ThanxReward", status: "Available", reward_points_required: -1) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "available?" do
    it "returns true if reward is available" do
      reward = Reward.create!(name: "ThanxReward", status: "Available", reward_points_required: 1)
      expect(reward.available?).to eq(true)
    end
    
    it "returns false if reward is unavailable" do
      reward = Reward.create!(name: "ThanxReward", status: "Unavailable", reward_points_required: 1)
      expect(reward.available?).to eq(false)
    end
  end

  describe ".available" do
    it "includes available rewards" do
      reward = Reward.create!(name: "ThanxReward", status: "Available", reward_points_required: 1)
      expect(Reward.available).to include(reward)
    end

    it "excludes unavailable rewards" do
      reward = Reward.create!(name: "ThanxReward", status: "Unavailable", reward_points_required: 1)
      expect(Reward.available).not_to include(reward)
    end
  end
end