class PagesController < ApplicationController

  def dashboard
    @bookings = Booking.where(user_id: current_user)
    @my_bookings = current_user.rock_bookings
  end
end
