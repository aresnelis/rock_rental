class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]
  # before_action :set_rock, only: [:new, :create]

  def new
    @review = Review.new
  end


  def create
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to rock_path(@booking.rock)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to booking_path(@review.booking), status: :see_other
  end

  private
  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  # def set_rock
  #   @rock = Rock.find(params[:rock_id])
  # end

  def review_params
    params.require(:review).permit(:content, :rating, :rock_id, :booking_id)
  end
end
