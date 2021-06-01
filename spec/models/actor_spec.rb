require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many :movie_actor}
    it { should have_many(:movie).through(:movie_actor) }
  end

  describe 'class models' do
    describe '#actor_list_special' do
      it 'orders distinct actors who have worked for studios by age if they are currently working' do
        studio = Studio.create(name: 'Paramount', location: 'Iowa')
        movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
        movie_2 = studio.movies.create(title: 'Future Shock', creation_year: '2021', genre: 'comedy')
        actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: false)
        actor_2 = Actor.create(name: 'MZuko', age: 16, currently_working: true)
        actor_3 = Actor.create(name: 'Ben Fold', age: 45, currently_working: true)
        MovieActor.create(movie: movie_1, actor: actor_1)
        MovieActor.create(movie: movie_2, actor: actor_2)
        MovieActor.create(movie: movie_2, actor: actor_3)
        MovieActor.create(movie: movie_1, actor: actor_3)

        expect(Actor.actor_list_special).to eq([actor_3, actor_2])
      end
    end
  end
end
