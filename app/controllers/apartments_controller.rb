class ApartmentsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "address ILIKE :query OR title ILIKE :query"
       @apartments = Apartment.where(sql_query, query: "%#{params[:query]}%")
    else
      @apartments = Apartment.all
    end
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartments_params)
    @apartment.user = current_user

    if @apartment.save
      redirect_to apartments_path
    else
      render :new
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  private

  def apartments_params
    params.require(:apartment).permit(:title, :address, :photo, :price, :photo_cache)
  end
end
