require 'rails_helper'

RSpec.describe Playlist, "associations and validations", type: :model do
  it { should have_many(:playlist_songs) }
  it { should have_many(:songs).through(:playlist_songs) }
  it { should validate_presence_of(:name) }
end
