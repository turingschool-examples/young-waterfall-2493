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
  it 'shows the actors that are in its movies' do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie_2 = studio_1.movies.create!(title: 'Something', creation_year: 1997, genre: 'Drama')
    actor_1 = movie_1.actors.create!(name: 'Chris P. Bacon', age:54, currently_working: true)
    actor_2 = movie_1.actors.create!(name: 'Anita Nappe', age:87, currently_working: false)
    actor_3 = movie_1.actors.create!(name: 'Crystall Ball', age:34, currently_working: true)
    actor_3 = movie_2.actors.create!(name: 'Crystall Ball', age:34, currently_working: true)
    actor_5 = movie_2.actors.create!(name: 'Jay Walker', age:18, currently_working: true)
    actor_6 = movie_2.actors.create!(name: 'Justin Thyme', age:45, currently_working: false)
    actor_1 = Actor.create!(name: 'Chris P. Bacon', age:54, currently_working: true)
    actor_2 = Actor.create!(name: 'Anita Nappe', age:87, currently_working: false)
    actor_3 = Actor.create!(name: 'Crystall Ball', age:34, currently_working: true)
    actor_4 = Actor.create!(name: 'Jay Walker', age:18, currently_working: true)
    actor_5 = Actor.create!(name: 'Justin Thyme', age:45, currently_working: false)
    
    visit "/studios/#{studio_1.id}"
    save_and_open_page
    expect(page).to have_content(actor_1.name)
  end
end