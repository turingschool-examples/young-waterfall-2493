require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many(:actor_movies)}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe 'methods' do
    describe '#add_actor_options' do
      it "gives the id and name of all actors not assoc with a movie" do
        studio = Studio.create! attributes_for(:studio)
        movie = studio.movies.create! attributes_for(:movie)
        actor1 = Actor.create! attributes_for(:actor)
        actor2 = Actor.create! attributes_for(:actor)
        actor1.movies << movie

        expect(movie.add_actor_options).to eq([[actor2.name, actor2.id]])
      end
    end
  end
end
