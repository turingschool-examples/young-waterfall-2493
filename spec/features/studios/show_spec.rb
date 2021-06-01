require 'rails_helper'

RSpec.describe 'studio show page' do
    before(:each) do
      @studio = Studio.create!(name: "Whatever Studio", location: "Anywhere, World")
      @movie_1 = Movie.create!(title: "Movie One", creation_year: 2020, genre: "Comedy", studio_id: @studio.id)
      @movie_2 = Movie.create!(title: "Movie Two", creation_year: 2018, genre: "Thriller", studio_id: @studio.id)
      @movie_3 = Movie.create!(title: "Movie Three", creation_year: 2010, genre: "Romance", studio_id: @studio.id)
    end

    it 'shows the name and location of the studio and the titles of all of its movies' do
    visit "/studios/#{@studio.id}"

    expect(page).to have_content("#{@studio.name}")
    expect(page).to have_content("#{@studio.location}")
    expect(page).to have_content("#{@movie_1.title}")
    expect(page).to have_content("#{@movie_2.title}")
    expect(page).to have_content("#{@movie_3.title}")
  end
end
