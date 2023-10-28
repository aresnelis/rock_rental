class Booking < ApplicationRecord
  belongs_to :rock
  belongs_to :user
  has_one :review

  validates :start_time, :end_time, presence: true
end
