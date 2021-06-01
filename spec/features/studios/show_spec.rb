require 'rails_helper'

# Story 1
# Studio Show
 
# As a user,
# When I visit a studio show page
# I see the studio's name and location
# And I see the titles of all of its movies

RSpec.describe 'studio show page' do
  describe 'display' do
    before :each do 
      @studio = Studio.create!(name: "Colby Studios", location: "Boston")
      @raiders = @studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981 , genre: 'Action/Adventure')
      @howl = @studio.movies.create!(title: "Howl's Moving Castle", creation_year: 2004 , genre: 'Fantasy')
      @snow_white = @studio.movies.create!(title: 'Snow White and the Seven Dwarves', creation_year: 1960 , genre: 'Fairytale')
    end

    it 'show studio and attributes' do
      visit "/studios/#{@studio.id}"

      expect(page).to have_content("#{@studio.name}")
      expect(page).to have_content("Location: #{@studio.location}")
    end

    it 'titles of studio movies' do
      visit "/studios/#{@studio.id}"

      expect(page).to have_content("All Movies:")
      expect(page).to have_content("* #{@raiders.title}")
      expect(page).to have_content("* #{@howl.title}")
      expect(page).to have_content("* #{@snow_white.title}")
    end
  end 
end