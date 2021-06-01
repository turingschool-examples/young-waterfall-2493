require 'rails_helper'

RSpec.describe 'movies show page' do
  describe 'visit' do
    it 'shows a movies title creation year genre and all actors' do
      studio = Studio.create(name: 'Paramount', location: 'Iowa')
      movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
      actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: false)
      actor_2 = Actor.create(name: 'MZuko', age: 16, currently_working: true)
      MovieActor.create(movie: movie_1, actor: actor_1)
      MovieActor.create(movie: movie_1, actor: actor_2)

      visit "movies/#{movie_1.id}"

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.creation_year)
      expect(page).to have_content(movie_1.genre)
      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_2.name)
    end
  end
  describe 'add actor' do
    it 'has a button to add actors to a movie' do
      studio = Studio.create(name: 'Paramount', location: 'Iowa')
      movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')

      visit "movies/#{movie_1.id}"

      expect(page).to have_button('Submit')
    end
    it 'can select any actor not in to movie to be added to the movie' do
      studio = Studio.create(name: 'Paramount', location: 'Iowa')
      movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
      actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: false)
      actor_2 = Actor.create(name: 'MZuko', age: 16, currently_working: true)

      visit "movies/#{movie_1.id}"

      find('#actor_id').find(:xpath, 'option[2]').select_option

      click_button 'Submit'

      expect(page).to have_current_path("/movies/#{movie_1.id}")
      expect(page).to have_content(actor_1.name)
    end
  end
end
