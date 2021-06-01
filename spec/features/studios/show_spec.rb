require 'rails_helper'

RSpec.describe 'studio show page' do
  it 'shows the studio and its attributes' do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    # movie_1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    # movie_2 = Movie.create!(title: 'Something', creation_year: 1997, genre: 'Drama')
    # studio_1.movies << movie_1
    # studio_1.movies << movie_2

    visit "/studios/#{studio_1.id}"

    expect(page).to have_content(studio_1.name)
    # expect(page).to have_content(movie_1.name)
    # expect(page).to have_content(movie_2.name)
  end
end