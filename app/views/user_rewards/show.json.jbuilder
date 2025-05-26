json.user_reward do
    json.id @user_reward.id
    json.user @user.username
    json.reward @reward.name
end