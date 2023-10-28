class PagesController < ApplicationController

  def dashboard
    @bookings = Booking.where(user_id: current_user)
    @rock = Rock.new
  end
end
