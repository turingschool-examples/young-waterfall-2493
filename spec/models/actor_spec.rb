require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe 'class methods' do
    it 'can search by name' do
      @actor_1 = Actor.create!(name: 'Actor One', age: 23, currently_working: false)
      @actor_2 = Actor.create!(name: 'Actor Two', age: 44, currently_working: true)
      
      expect(Actor.search_by_name('Actor One')).to eq([@actor_1])
    end
  end
end
