class ReservationsController < ApplicationController
  def new
    @apartment = Apartment.find(params[:apartment_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def check_in_date(date)
    @check_in_date = date
  end

  def check_out_date(date)
    @check_out_date = date
  end

  private

  def reservations_params
    params.require(:reservation).permit(:date_in, :date_out)
  end
end
