require 'rails_helper'

RSpec.feature "user can view all playlists" do
  scenario "if there are already playlists in the database" do
    playlists = create_list(:playlist, 2)

    visit("/playlists")

    expect(page).to have_content("#{playlists[0].name}")
    expect(page).to have_content("#{playlists[1].name}")

    click_on("#{playlists[0].name}", match: :first)

    expect(current_path).to eq(playlist_path(playlists[0]))
    expect(page).to have_content(playlists[0].name)
  end
end
