class Booking < ApplicationRecord
  belongs_to :rock
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :start_time, :end_time, presence: true

  def self.upcoming_bookings_for_user(user)
    Booking.where('start_time > ? AND user_id = ?', Time.now, user.id)
  end
end
