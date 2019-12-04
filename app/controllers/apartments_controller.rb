class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartments_params)
    @apartment.user = current_user

    if @apartment.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  private

  def apartments_params
    params.require(:apartment).permit(:title, :address, :photo, :photo_cache)
  end
end
