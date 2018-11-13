class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    find_booking
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render "new"
    end
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in_at, :check_out_at)
  end

end
