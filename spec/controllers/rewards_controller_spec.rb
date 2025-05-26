require "rails_helper"

RSpec.describe RewardsController, type: :controller do
  describe "GET index" do
    it "successfully returns" do
      reward = Reward.new(id: 1, name: "ThanxReward", status: "Available", reward_points_required: 10)
      reward.save
      get :index, :params => { format: :json }
      expect(response).to have_http_status(:ok)
    end
  end
end
