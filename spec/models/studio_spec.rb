require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it {should have_many :movies}
  end

  describe 'methods' do
    describe '#actor' do
      it "finds actors for this studio" do
        studio = Studio.create! attributes_for(:studio)
        movie1 = studio.movies.create! attributes_for(:movie)
        movie2 = studio.movies.create! attributes_for(:movie)
        actor1 = Actor.create! name: 'Actor 1', age: 20, currently_working: true
        actor2 = Actor.create! name: 'Actor 2', age: 21, currently_working: false
        actor3 = Actor.create! name: 'Actor 3', age: 22, currently_working: true
        actor1.movies << [movie1, movie2]
        actor2.movies << [movie1, movie2]
        actor3.movies << [movie1, movie2]

        [actor3, actor1]

        expect(studio.actors).to include(actor3)
        expect(studio.actors).to include(actor1)
      end
    end
  end
end
