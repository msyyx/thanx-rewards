class UserRewardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user
  before_action :find_reward, only: [:create]

  def index
    @user_rewards = @user.user_rewards
    render :index, status: :ok
  end

  def create
    @user_reward = CreateUserReward.new(@user, @reward).perform
    render :show, status: :created
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_reward
    @reward = Reward.find(params[:reward_id])
  end
end
