class Booking < ApplicationRecord
  belongs_to :rock
  belongs_to :user
  has_many :reviews

  validates :start_time, :end_time, presence: true
end
