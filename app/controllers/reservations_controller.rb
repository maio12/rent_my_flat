class ReservationsController < ApplicationController
  before_action :set_apartment, except: :destroy
  def new
    @reservation = @apartment.Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to apartment_path
    else
      render :new
    end
  end

  private

  def reservations_params
    params.require(:reservation).permit(:date_in, :date_out)
  end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end
end
