require 'rails_helper'

RSpec.feature "User can delete an artist" do
  scenario "with a previously created artist" do
    artist = create(:artist)

    visit(artist_path(artist))
    click_on("Delete")

    expect(current_path).to eq(artists_path)
    expect(page).to_not have_content(artist.name)
  end
end
