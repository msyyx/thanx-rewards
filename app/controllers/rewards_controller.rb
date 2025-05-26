class RewardsController < ApplicationController
  def index
    @rewards = Reward.available
    render :index, status: :ok
  end
end
