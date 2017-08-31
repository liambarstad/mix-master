require 'rails_helper'

RSpec.feature "user can create a playlist" do
  scenario "given that artist and songs exist" do
    artist = create_list(:artist, 2)
    song1 = create_list(:song, 2, artist: artist[0])
    song2 = create_list(:song, 2, artist: artist[1])
    # playlist = build(:playlist)

    visit("/playlists")
    click_on("New Playlist")
    fill_in "playlist_name", with: "My Stuff"
    check("song-#{song1[0].id}")
    check("song-#{song1[1].id}")
    check("song-#{song2[0].id}")
    check("song-#{song2[1].id}")
    click_on("Create Playlist")

    expect(current_path).to eq("/playlists/#{Playlist.last.id}")
    expect(page).to have_content("My Stuff")
    expect(page).to have_content(song1[0].title)
    expect(page).to have_content(song2[0].title)

    click_on(song1[0].title, match: :first)

    expect(current_path).to eq("/artists/#{artist[0].id}/songs/#{song1[0].id}")
  end
end
