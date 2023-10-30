class BookingsController < ApplicationController
  before_action :set_rock, only: [:new, :create, :show]
  before_action :set_booking, only: [:accept, :decline, :destroy, :show]


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
    if @booking.update(status: 'accepted')
      redirect_to dashboard_path, notice: 'Booking accepted'
    else
      redirect_to dashboard_path, alert: 'Failed to accept booking'
    end
  end

  def decline
    if @booking.update(status: 'declined')
      redirect_to dashboard_path, notice: 'Booking declined'
    else
      redirect_to dashboard_path, alert: 'Failed to decline booking'
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :rock_id, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_rock
    @rock = Rock.find(params[:rock_id])
  end
end
