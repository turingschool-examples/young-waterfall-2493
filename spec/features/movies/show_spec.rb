require 'rails_helper'

RSpec.describe 'studio show page' do
  describe 'display' do
    before :each do 
      @studio = Studio.create!(name: "Colby Studios", location: "Boston")
      @howl = @studio.movies.create!(title: "Howl's Moving Castle", creation_year: 2004 , genre: 'Fantasy')
      @jacob = @howl.actors.create!(name: "Jacob Ordy", age: 13, currently_working: true)
      @allison = @howl.actors.create!(name: "Allison Ray", age: 24, currently_working: true)
      @snow_white = @studio.movies.create!(title: 'Snow White and the Seven Dwarves', creation_year: 1960 , genre: 'Fairytale')
      @bill = @snow_white.actors.create!(name: "Bill Wise", age: 63, currently_working: true)
    end

    it 'show movie and attributes' do
      visit "/movies/#{@howl.id}"

      expect(page).to have_content("#{@howl.title}")
      expect(page).to have_content("Creation Year: #{@howl.creation_year}")
      expect(page).to have_content("Genre: #{@howl.genre}")
    end

    it 'lists all actors in movie' do
      visit "/movies/#{@howl.id}"

      expect(page).to have_content("All Actors:")
      expect(page).to have_content("* #{@jacob.name}")
      expect(page).to have_content("* #{@allison.name}")
      expect(page).to_not have_content("* #{@bill.name}")
    end

    it 'has form to add actor to movie' do
      visit "/movies/#{@howl.id}"
      
      expect(page).to_not have_content("* #{@bill.name}")

      fill_in 'Actor Name', with: 'Bill Wise'
      click_on('Add Actor')

      expect(page).to have_content("* #{@bill.name}")
    end
  end 
end