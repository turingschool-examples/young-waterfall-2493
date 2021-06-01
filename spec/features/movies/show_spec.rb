require 'rails_helper'

RSpec.describe 'Movie show page' do
  before(:each) do
    @studio = Studio.create!(name: "Whatever Studio", location: "Anywhere, World")
    @movie_1 = Movie.create!(title: "Movie One", creation_year: 2020, genre: "Comedy", studio_id: @studio.id)
    @movie_2 = Movie.create!(title: "Movie Two", creation_year: 2018, genre: "Thriller", studio_id: @studio.id)
    @movie_3 = Movie.create!(title: "Movie Three", creation_year: 2010, genre: "Romance", studio_id: @studio.id)

    @actor_1 = Actor.create!(name: 'Actor One', age: 23, currently_working: false)
    @actor_2 = Actor.create!(name: 'Actor Two', age: 44, currently_working: true)
    @actor_3 = Actor.create!(name: 'Actor Three', age: 52, currently_working: true)
    @actor_4 = Actor.create!(name: 'Actor Four', age: 73, currently_working: true)
    @actor_5 = Actor.create!(name: 'Actor Five', age: 29, currently_working: true)
    @actor_6 = Actor.create!(name: 'Actor Six', age: 38, currently_working: true)

    @movie_1.actors << @actor_1
    @movie_1.actors << @actor_2
    @movie_2.actors << @actor_3
    @movie_2.actors << @actor_4
    @movie_3.actors << @actor_5
    @movie_3.actors << @actor_6
  end

  it 'shows the movie title, creation year, genre, and actors' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("#{@movie_1.title}")
    expect(page).to have_content("#{@movie_1.creation_year}")
    expect(page).to have_content("#{@movie_1.genre}")
    expect(page).to have_content("#{@actor_1.name}")
    expect(page).to have_content("#{@actor_2.name}")

    visit "/movies/#{@movie_3.id}"

    expect(page).to have_content("#{@movie_3.title}")
    expect(page).to have_content("#{@movie_3.creation_year}")
    expect(page).to have_content("#{@movie_3.genre}")
    expect(page).to have_content("#{@actor_5.name}")
    expect(page).to have_content("#{@actor_6.name}")
  end
end
