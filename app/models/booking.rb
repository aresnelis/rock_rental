class Booking < ApplicationRecord
  belongs_to :rock
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :start_time, :end_time, presence: true

  def self.upcoming_bookings_for_user(user)
    Booking.where('start_time > ? AND user_id = ?', Time.now, user.id)
  end

  def total_price
    daily_price = Rock.find(self.rock_id).daily_price
    price = daily_price * ((self.end_time - self.start_time) / (24 * 60 * 60 ))
  end
end
