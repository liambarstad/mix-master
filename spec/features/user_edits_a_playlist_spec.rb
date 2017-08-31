require 'rails_helper'

RSpec.feature "user can edit a playlist" do
  scenario "the playlist already exists" do
    playlist = create(:playlist)
    song = create_list(:song, 2)
    playlistsong1 = create(:playlist_song, song: song[0], playlist: playlist)

    visit(playlists_path(playlist))
    click_on("Edit", match: :first)
    fill_in "playlist_name", with: "Do some Shloopin"
    uncheck("song-#{song[0].id}")
    check("song-#{song[1].id}")
    click_on("Update Playlist")

    expect(current_path).to eq(playlist_path(playlist))
    expect(page).to have_content("Do some Shloopin")
    expect(page).to have_content(song[0].title)
    expect(page).to have_content(song[1].title)
  end
end
