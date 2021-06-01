require 'rails_helper'

RSpec.describe Movie do 
  before(:each) do 
    @studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood') 

    @movie = @studio.movies.create!(title: 'Sound of Metal', creation_year: 2020, genre: 'Action')   

    @actor_1 = @movie.actors.create!(name: 'John Boyega', age: 27, currently_working: true)
    @actor_2 = @movie.actors.create!(name: 'Samuel L Jackson', age: 81, currently_working: false)
    @actor_3 = @movie.actors.create!(name: 'Lakeith Stanfield', age: 33, currently_working: true)
    @actor_4 = @movie.actors.create!(name: 'Brian Henry', age: 36, currently_working: true) 
  end    
  
  # Story 3 
  it 'shows a movies attributes' do
    visit "/movies/#{@movie.id}"  

    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
  end    

  it 'shows all the actors in a movie' do
    visit  "/movies/#{@movie.id}"
    
    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_2.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to have_content(@actor_4.name)
  end
end 