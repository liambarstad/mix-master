require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario "editing an existing artist" do
    artist = create(:artist)

    visit("/")
    click_on("Edit", match: :first)

    expect(current_path).to eq(edit_artist_path(artist))

    fill_in "artist_name", with: "DJ Khaled"
    image = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    click_on("Update Artist")

    expect(current_path).to eq(artist_path(artist.id))
    expect(page).to have_content("DJ Khaled")
    expect(page).to have_css("img[src=#{image}]")
  end
end
