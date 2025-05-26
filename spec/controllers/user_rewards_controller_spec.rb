require "rails_helper"

RSpec.describe UserRewardsController, type: :controller do
  describe "GET index" do
    it "successfully returns" do
      user = User.new(id: 1, username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 10)
      user.save
      get :index, :params => { :user_id => user.id, format: :json }
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe "POST create" do
    it "successfully returns if reward is available and user balance is more than points required" do
      user = User.new(id: 1, username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 10)
      user.save
      reward = Reward.new(id: 1, name: "ThanxReward", status: "Available", reward_points_required: 10)
      reward.save
      post :create, :params => { "user_id": user.id, "reward_id": reward.id, format: :json }
      expect(response).to have_http_status(:created)
    end

    it "returns bad_request if reward is unavailable" do
      user = User.new(id: 1, username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 10)
      user.save
      reward = Reward.new(id: 1, name: "ThanxReward", status: "Unavailable", reward_points_required: 10)
      reward.save
      
      expect { post :create, :params => { "user_id": user.id, "reward_id": reward.id } }.to raise_error ActionController::BadRequest
    end

    it "returns bad_request if user balance is less than points required" do
      user = User.new(id: 1, username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 0)
      user.save
      reward = Reward.new(id: 1, name: "ThanxReward", status: "Available", reward_points_required: 10)
      reward.save
      
      expect { post :create, :params => { "user_id": user.id, "reward_id": reward.id } }.to raise_error ActionController::BadRequest
    end
  end
end
