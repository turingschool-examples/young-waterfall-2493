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
  end
end
