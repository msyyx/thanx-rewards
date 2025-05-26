class User < ApplicationRecord
  has_secure_password
  has_many :user_rewards, dependent: :destroy

  validates :username, presence: true, :uniqueness => true
  validates :password_digest, presence: true
  validates :reward_points, presence: true

  validate :reward_points_cannot_be_negative_value

  private

  def reward_points_cannot_be_negative_value
    if reward_points.present? && reward_points < 0
      errors.add(:reward_points, "can't be a negative value")
    end
  end

end
