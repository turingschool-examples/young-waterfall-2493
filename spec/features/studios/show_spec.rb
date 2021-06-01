require 'rails_helper'

RSpec.describe 'studio show page' do
  it 'shows the studio and its attributes' do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie_2 = studio_1.movies.create!(title: 'Something', creation_year: 1997, genre: 'Drama')

    visit "/studios/#{studio_1.id}"
    
    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(studio_1.location)
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_2.title)
  end
end