class BookingsController < ApplicationController
  before_action :set_rock, only: [:new, :create, :show]
  before_action :set_booking, only: [:destroy, :show]


  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.rock = @rock
    @booking.user = current_user
    if @booking.save
      redirect_to rock_path(@rock)
    else
      render :new, status: :unprocessable_entry
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end


  def accept
    # if dates are available change status to booked
    # if dates are unavailable change status to available
  end

  def decline

  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :rock_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_rock
    @rock = Rock.find(params[:rock_id])
  end
end
