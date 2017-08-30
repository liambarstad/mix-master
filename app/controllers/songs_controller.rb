class SongsController < ApplicationController
  before_action :find_artist, only: [:new, :show]

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    redirect_to song_path(@song)
  end

  private

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title)
  end

end
