class ReviewsController < ApplicationController
  def new
    @apartment = Apartment.find(params[:apartment_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @apartment, notice: 'Your review was successfully created'
    else
      render :new, alert: 'Your review was not saved'
    end
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
