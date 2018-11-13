class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save, notice: 'Artist was successfully created.'
      redirect_to artists_path(@artist)
    else
      render "new"
    end
  end

  def show
    find_artist
    # Add show
    # Add booking form
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :description, :address, :hour_rate)
  end

end
