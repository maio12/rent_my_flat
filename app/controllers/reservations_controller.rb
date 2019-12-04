class ReservationsController < ApplicationController
  before_action :set_apartment, except: :destroy

  def index
    @reservations = Reservation.where(user: current_user)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = @apartment.reservations.new
  end

  def create
    @reservation = @apartment.reservations.new(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to apartment_path(@apartment), notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: 'Succesfully updated'
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  def reservation_params
    params.require(:reservation).permit(:date_in, :date_out, :user_id, :apartment_id)
  end
end

  def set_apartment
    @apartment = Apartment.find(params[:apartment_id])
  end
