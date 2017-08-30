require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario "editing an existing artist" do
    artist = create(:artist)

    visit("/")
    click_on("Edit", match: :first)
    fill_in "artist_name", with: "DJ Khaled"
    image = params[:image_path]
    click_on("Update Artist")

    expect(current_path).to eq(artist_path(params[:id]))
    expect(page).to have_content("DJ Khaled")
    expect(page).to have_css("img[src=#{image}]")
  end
end
