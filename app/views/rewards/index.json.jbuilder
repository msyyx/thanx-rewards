json.array! @rewards do |reward|
  json.id reward.id
  json.name reward.name
  json.reward_points_required reward.reward_points_required
end