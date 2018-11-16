class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @artists = Artist.all

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
    @lastbooking = Booking.where(user: current_user, artist: @artist).last
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :description, :address, :hour_rate, :public_id, :category_id, :photo)
  end
end
