require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it {should have_many(:actor_movies)}
    it {should have_many(:movies).through(:actor_movies)}
  end
  describe 'methods' do
    describe '#coactors' do
      it "get all actors this actor has worked with" do
        studio = Studio.create! attributes_for(:studio)
        movie = studio.movies.create! attributes_for(:movie)
        actor1 = Actor.create! attributes_for(:actor)
        actor2 = Actor.create! attributes_for(:actor)
        movie.actors << [actor1, actor2]

        expect(actor1.coactors).to eq([actor2])
        expect(actor2.coactors).to eq([actor1])
      end
    end
  end
end
