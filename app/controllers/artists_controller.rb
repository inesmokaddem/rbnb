class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    # @artists = Artist.all
    @artists = Artist.where.not(latitude: nil, longitude: nil)

    @markers = @artists.map do |artist|
      {
        lng: artist.longitude,
        lat: artist.latitude
      }
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user
    if @artist.save
      redirect_to artist_path(@artist), notice: 'Artist was successfully created.'
    else
      render "new"
    end
  end

  def show
    @artist = Artist.find(params[:id])
    @booking = Booking.new
    @bookings = Booking.where(artist: @artist)
    # @reviews = @bookings.review
    # @ratings = @booking.rating
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :description, :address, :hour_rate, :public_id, :category_id, :photo)
  end
end
