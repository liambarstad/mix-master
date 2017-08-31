require 'rails_helper'

RSpec.feature "user can create a song" do
  scenario "if the artist is already in the database" do
    song = create(:song)
    artist = song.artist

    visit("/artists/#{artist.id}")
    click_on("New Song")
    fill_in "song_title", with: song.title
    click_on("Create Song")

    expect(current_path).to eq("/artists/#{artist.id}/songs/#{song.id}")
    expect(page).to have_content(song.title)

    click_on(artist.name)

    expect(current_path).to eq("/artists/#{artist.id}")
  end
end
