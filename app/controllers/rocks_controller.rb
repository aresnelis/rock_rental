class RocksController < ApplicationController
  before_action :set_rock, only: %i[show edit update destroy]

  def index
    @rocks = Rock.all
  end

  def show
  end

  def new
    @rock = Rock.new
  end

  def create
    @rock = Rock.new(rock_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def rock_params
    params.require(:rock).permit(:type, :daily_price, :description)
  end

  def set_rock
    Rock.find(params[:id])
  end
end
