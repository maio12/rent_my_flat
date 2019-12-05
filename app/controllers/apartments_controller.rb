class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
    #@apartments = Apartment.geocoded
    @markers = @apartments.map do |apartment|
      {
        lat: apartment.latitude,
        lng: apartment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { apartment: apartment })
        #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end

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
      redirect_to apartments_path, notice: 'Apartment was successfully added.'
    else
      render :new
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  private

  def apartments_params
    params.require(:apartment).permit(:title, :address, :city, :photo, :price, :photo_cache)
  end
end
