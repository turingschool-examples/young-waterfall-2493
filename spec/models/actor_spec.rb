require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many :movie_actor}
    it { should have_many(:movie).through(:movie_actor) }
  end
end
