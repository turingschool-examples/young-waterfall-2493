require 'rails_helper'

RSpec.describe 'studio show page' do
  describe 'visit' do
    it 'shows the name location and movie titles' do
      studio = Studio.create(name: 'Paramount', location: 'Iowa')
      movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
      movie_2 = studio.movies.create(title: 'Future Shock', creation_year: '2021', genre: 'comedy')
      visit "/studios/#{studio.id}"

      expect(page).to have_content(studio.name)
      expect(page).to have_content(studio.location)
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
    end
    it 'shows a list of all actors who have worked for them' do
      studio = Studio.create(name: 'Paramount', location: 'Iowa')
      movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
      movie_2 = studio.movies.create(title: 'Future Shock', creation_year: '2021', genre: 'comedy')
      actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: true)
      actor_2 = Actor.create(name: 'MZuko', age: 16, currently_working: true)
      actor_3 = Actor.create(name: 'Ben Fold', age: 45, currently_working: true)
      MovieActor.create(movie: movie_1, actor: actor_1)
      MovieActor.create(movie: movie_2, actor: actor_2)

      visit "/studios/#{studio.id}"

      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_2.name)
      expect(page).to_not have_content(actor_3.name)
    end
    it 'shows only lists actors once' do
      studio = Studio.create(name: 'Paramount', location: 'Iowa')
      movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
      movie_2 = studio.movies.create(title: 'Future Shock', creation_year: '2021', genre: 'comedy')
      actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: true)
      actor_2 = Actor.create(name: 'MZuko', age: 16, currently_working: true)
      MovieActor.create(movie: movie_1, actor: actor_1)
      MovieActor.create(movie: movie_2, actor: actor_1)
      MovieActor.create(movie: movie_2, actor: actor_2)

      visit "/studios/#{studio.id}"

      expect(page).to have_content(actor_1.name, count: 1)
    end
    it 'shows only lists actors who are currently working' do
      studio = Studio.create(name: 'Paramount', location: 'Iowa')
      movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
      actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: false)
      MovieActor.create(movie: movie_1, actor: actor_1)


      visit "/studios/#{studio.id}"

      expect(page).to_not have_content(actor_1.name)
    end
    it 'lists actors by age from oldest' do
      studio = Studio.create(name: 'Paramount', location: 'Iowa')
      movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
      movie_2 = studio.movies.create(title: 'Future Shock', creation_year: '2021', genre: 'comedy')
      actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: true)
      actor_2 = Actor.create(name: 'MZuko', age: 16, currently_working: true)
      actor_3 = Actor.create(name: 'Ben Fold', age: 45, currently_working: true)
      MovieActor.create(movie: movie_1, actor: actor_1)
      MovieActor.create(movie: movie_2, actor: actor_2)
      MovieActor.create(movie: movie_2, actor: actor_3)


      visit "/studios/#{studio.id}"

      expect(actor_3.name).to appear_before(actor_1.name)
      expect(actor_1.name).to appear_before(actor_2.name)
    end
  end
end
