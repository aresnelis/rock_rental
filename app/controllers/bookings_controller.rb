class BookingsController < ApplicationController
  before_action :set_rock, only: %[create destroy]
  before action :set_booking, only: %[accept destroy]

  # def new
  #   @bookmarks = Bookmark.new
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.rock = @rock
    if @booking.save
      redirect_to rock_path(@rock)
    else
      render :new, status: :unprocessable_entry
    end
  end

  def accept
    # if dates are available change status to booked
    # if dates are unavailable change status to available

  end

  def decline

  end

  def destroy
    @booking.destroy
    redirect_to rock_path(@booking.rock)
  end

private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_rock
    @rock = Rock.find(params[:rock_id])
  end
end
