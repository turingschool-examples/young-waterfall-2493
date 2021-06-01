require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actor}
    it { should have_many(:actor).through(:movie_actor) }
  end
end
