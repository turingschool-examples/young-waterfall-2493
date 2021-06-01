require 'rails_helper'

RSpec.describe 'studio show page' do
  before(:each) do 
    @studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood') 

    @movie_1 = @studio.movies.create!(title: 'Sound of Metal', creation_year: 2020)   
    @movie_2 = @studio.movies.create!(title: 'The Dark Knight', creation_year: 2010)   

    @actor_1 = @movie_1.actors.create!(name: 'John Boyega', age: 27, currently_working: true)
    @actor_2 = @movie_1.actors.create!(name: 'Samuel L Jackson', age: 81, currently_working: false)
    @actor_3 = @movie_2.actors.create!(name: 'Lakeith Stanfield', age: 33, currently_working: true)
    @actor_4 = @movie_2.actors.create!(name: 'Brian Henry', age: 36, currently_working: true)
  end  
    
  #User Story 1  
  it 'shows a studio attributes ' do
    visit "/studio/#{@studio.id}"   

    expect(page).to have_content(@studio.name)
    expect(page).to have_content(@studio.location)
  end    

  it 'shows the titles of all the studio movies' do
    visit "/studio/#{@studio.id}"
    
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
  end

  #   Story 2
  # As a user,
  # When I visit a studio show page
  # I see a list of actors that have acted in any of the studio's movies
  # And I see that the list of actors is unique (no duplicate actors)
  # And I see that the list of actors is ordered from oldest actor to youngest
  # And I see that the list of actors only includes actors that are currently working
  it 'I see a list of actors that have acted in any of the studios movies' do
    visit "/studio/#{@studio.id}"

    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to have_content(@actor_4.name)
  end
end