class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :destroy]
  before_action :new_artist, only: [:update, :create]

  def index
    @artists = Artist.all
  end

  def edit
  end

  def update
    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def new_artist
    @artist = Artist.new(artist_params)
  end

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

end
