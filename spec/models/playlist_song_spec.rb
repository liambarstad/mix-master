require 'rails_helper'

RSpec.describe PlaylistSong, "associations", type: :model do
  it { should belong_to(:song) }
  it { should belong_to(:playlist) }
end
