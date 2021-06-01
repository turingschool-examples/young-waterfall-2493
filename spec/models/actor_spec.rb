require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:actor_movies) }
    it { should have_many(:movies).through(:actor_movies) }
  end

  before :each do
    @studio_3 = Studio.create!(name: 'Lucasfilm Ltd', location: 'San Francisco')

    @movie_3 = @studio_3.movies.create!(title: 'The Empire Strikes Back', creation_year: 1980, genre: 'Adventure')
    @movie_4 = @studio_3.movies.create!(title: 'Return of the Jedi', creation_year: 1983, genre: 'Adventure')

    @actor_1 = Actor.create!(name: 'Mark Hamill', age: 49, working: true) ##age was 69
    @actor_2 = Actor.create!(name: 'Cary Elwes', age: 58, working: true)
    @actor_3 = Actor.create!(name: 'Harrison Ford', age: 78, working: false)

    ActorMovie.create!(actor: @actor_3, movie: @movie_3)
    ActorMovie.create!(actor: @actor_1, movie: @movie_3)
    ActorMovie.create!(actor: @actor_3, movie: @movie_4)
    ActorMovie.create!(actor: @actor_1, movie: @movie_4)
  end

  describe 'instance methods' do
    describe '.acted_with' do
      it 'returns all co-actors that were in the same movies' do
        # expect(@actor_1.acted_with).to eq([@actor_3])
      end
    end
  end

end
