class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:id])
    @booking.update(review_params)
    redirect_to artist_path(@booking.artist)
  end

  private

  def review_params
    params.require(:booking).permit(:review, :rating)
  end
end
