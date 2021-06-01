require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many(:movies).through(:actor_movies)}
  end

  before(:each) do
    @actor_1 = Actor.create!(name: 'Actor One', age: 23, currently_working: false)
    @actor_2 = Actor.create!(name: 'Actor Two', age: 44, currently_working: true)
  end

  describe 'class methods' do
    it 'can search by name' do
      expect(Actor.search_by_name('Actor One').first.name).to eq(@actor_1.name)
    end
  end
end
