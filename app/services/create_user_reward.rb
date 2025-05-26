class CreateUserReward
  def initialize user, reward
    @user = user
    @reward = reward
  end

  def perform
    validate_reward_available
    validate_user_balance_covers_reward_points_required
    ActiveRecord::Base.transaction do
      remaining_points = @user.reward_points - @reward.reward_points_required
      @user.update!(:reward_points => remaining_points)
      UserReward.create!(user: @user, reward: @reward)
    end
  end

  private

  def validate_user_balance_covers_reward_points_required
    raise ActionController::BadRequest.new(), "User balance insufficient" if @user.reward_points < @reward.reward_points_required
  end

  def validate_reward_available
    raise ActionController::BadRequest.new(), "Reward unavailable" unless @reward.available?
  end
end