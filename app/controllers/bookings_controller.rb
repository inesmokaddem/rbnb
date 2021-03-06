class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    find_booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.artist = Artist.find(params[:artist_id])
    @booking.user = current_user

    if @booking.save
      redirect_to artist_path(@booking.artist), notice: 'Booking was successfully created.'
    else
      render 'artists/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
