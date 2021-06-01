require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actor}
    it { should have_many(:actor).through(:movie_actor) }
  end

  describe 'instance variables' do
    describe '.non_appearing' do
      it 'returns all actors not in that movie' do
        studio = Studio.create(name: 'Paramount', location: 'Iowa')
        movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
        actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: false)
        actor_2 = Actor.create(name: 'MZuko', age: 16, currently_working: true)
        actor_3 = Actor.create(name: 'Ben Fold', age: 45, currently_working: true)
        MovieActor.create(movie: movie_1, actor: actor_1)

        expect(movie_1.non_appearing).to eq([actor_2, actor_3])
      end
    end
  end
end
