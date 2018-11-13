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
    if @artist.save
      redirect_to artists_path(@artist), notice: 'Artist was successfully created.'
    else
      render "new"
    end
  end

  def show
    @artist = Artist.find(params[:id])
    # Add show
    # Add booking form
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :description, :address, :hour_rate)
  end

end
