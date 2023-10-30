class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rocks, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :rock_bookings, through: :rocks, source: :bookings
end
