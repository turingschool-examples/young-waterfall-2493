require 'rails_helper'

RSpec.describe 'studio show page' do
  before(:each) do 
  @studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood') 
  @movie_1 = @studio.movies.create!(title: 'Sound of Metal', creation_year: 2020)   
  @movie_2 = @studio.movies.create!(title: 'The Dark Knight', creation_year: 2010)   
  end  
    
  #User Story 1  
  it 'shows a studio attributes ' do
    visit "/studio/#{@studio.id}"   

    expect(page).to have_content(@studio.name)
    expect(page).to have_content(@studio.location)
  end    

  xit 'shows the titles of all the studio movies' do
  end
end