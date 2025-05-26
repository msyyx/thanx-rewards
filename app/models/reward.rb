class Reward < ApplicationRecord
  validates :name, presence: true, :uniqueness => true
  validates :reward_points_required, presence: true

  validate :reward_points_required_cannot_be_negative_value
  
  enum :status, { available: "Available", unavailable: "Unavailable" }

  private

  def reward_points_required_cannot_be_negative_value
    if reward_points_required.present? && reward_points_required < 0
      errors.add(:reward_points_required, "can't be a negative value")
    end
  end
end
