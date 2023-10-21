class Booking < ApplicationRecord
  belongs_to :rock
  belongs_to :user
end
