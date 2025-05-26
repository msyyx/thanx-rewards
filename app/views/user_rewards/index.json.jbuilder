json.array! @user_rewards do |user_reward|
  json.id user_reward.id
  json.reward_id user_reward.reward.id
  json.name user_reward.reward.name
  json.reward_points_required user_reward.reward.reward_points_required
end