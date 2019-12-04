class ReviewsController < ApplicationController
  def create

    @review = Review.new(review_params)
    @reservation = Reservation.find(params[:reservation_id])
    @review.reservation = @reservation

    if @review.save

      redirect_to @reservation.apartment, notice: 'Your review was successfully created'
    else
      render :new, alert: 'Your review was not saved'
    end
  end

  def new
    @reservation = Reservation.find(params[:reservation_id])
    @review = Review.new
  end

  def review_params
    params.require(:review).permit(:rating, :content, :reservation_id)
  end
end
