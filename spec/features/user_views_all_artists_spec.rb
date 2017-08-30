require 'rails_helper'

RSpec.feature "User views all artists artist" do
  scenario "give that artists exist in the database" do
    artists = create_list(:artist, 3)
    visit("/")

    expect(page).to have_content("#{artists[0].name}")
    expect(page).to have_content("#{artists[1].name}")
    expect(page).to have_content("#{artists[2].name}")

    click_on("#{artists[0].name}")

    expect(current_path).to eq(artist_path(artists[0]))
  end
end
