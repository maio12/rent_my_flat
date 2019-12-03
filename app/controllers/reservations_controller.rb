class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user: current_user)
  end

  def show
    @reservation = Reservation.find(params[:id])
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
    @resertion.destroy
  end

 def reservation_params
    params.require(:reservation).permit(:date_in, :date_out, :user_id, :apartment_id)
  end
end
