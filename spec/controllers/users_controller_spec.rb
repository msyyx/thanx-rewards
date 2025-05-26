require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET show" do
    it "successfully returns if user exists" do
      user = User.new(id: 1, username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 10)
      user.save
      get :show, :params => { :id => user.id, format: :json }
      expect(response).to have_http_status(:ok)
    end

    it "returns not_found error if user doesn't exist" do
      user = User.new(id: 1, username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 10)
      user.save

      expect{ get :show, :params => { :id => 23 } }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
