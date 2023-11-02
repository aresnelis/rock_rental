class RocksController < ApplicationController
  before_action :set_rock, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @rocks = Rock.all
  end

  def show
    @rock = Rock.find(params[:id])
    end

  def new
    @rock = Rock.new
  end

  def create
    @rock = Rock.new(rock_params)
    @rock.user = current_user
    if @rock.save
      redirect_to rock_path(@rock)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    set_rock

  end

  def update
  end

  def destroy
    @rock = set_rock
    @rock.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def rock_params
    params.require(:rock).permit(:type, :daily_price, :description, :photo)
  end

  def set_rock
    @rock = Rock.find(params[:id])
  end
end
