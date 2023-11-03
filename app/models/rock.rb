class Rock < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :rock_type, :daily_price, :description, presence: true
end
