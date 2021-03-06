class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.geocoded
    if params[:query].present?

      # Apartment.near(params[:query], 100)
      sql_query = "address ILIKE :query OR title ILIKE :query"
      @apartments = Apartment.where(sql_query, query: "%#{params[:query]}%")
    else
      @apartments = Apartment.geocoded
    end
      @markers = @apartments.map do |apartment|
        {
          lat: apartment.latitude,
          lng: apartment.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { apartment: apartment })
          #image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
        }
          # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
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

    @apartment_geocoded = Apartment.geocoded

    @markers = {
        lat: @apartment_geocoded[0].latitude,
        lng: @apartment_geocoded[0].longitude,
        infoWindow: render_to_string(partial: "info_window_show", locals: { apartment: @apartment_geocoded })

    }
  end

  private

  def apartments_params
    params.require(:apartment).permit(:title, :address, :city, :photo, :price, :photo_cache)
  end
end
