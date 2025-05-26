# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.find_or_create_by!(username: "Thanx", password_digest: BCrypt::Password.create("Thanx"), reward_points: 1000)

["Paper Clip", "Pencil"].each do |reward|
    Reward.find_or_create_by!(name: reward, status: "Available", reward_points_required: 50)
end
["Speakers", "Monitor"].each do |reward|
    Reward.find_or_create_by!(name: reward, status: "Available", reward_points_required: 250)
end
Reward.find_or_create_by!(name: "Cat", status: "Unavailable", reward_points_required: 5000)
Reward.find_or_create_by!(name: "Boat", status: "Available", reward_points_required: 50000)