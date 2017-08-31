class PlaylistsController < ApplicationController
  before_action :find_playlist, only: [:show, :edit]
  before_action :new_playlist, only: [:create, :update]
  before_action :get_songs, only: [:new, :edit]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    if @playlist.save
      redirect_to @playlist
    else
      redirect_to new_playlist_path
    end
  end

  def show
    @songs = @playlist.songs
  end

  def edit
  end

  def update
    if @playlist.save
      redirect_to @playlist
    else
      redirect_to edit_playlist_path(@playlist)
    end
  end

  private

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def new_playlist
    @playlist = Playlist.new(playlist_params)
  end

  def get_songs
    @songs = Song.all
  end

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

end
