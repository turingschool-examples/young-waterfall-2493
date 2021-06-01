require 'rails_helper'

# Story 2
# Studio's Actors

# As a user,
# When I visit a studio show page
# I see a list of actors that have acted in any of the studio's movies
# And I see that the list of actors is unique (no duplicate actors)
# And I see that the list of actors is ordered from oldest actor to youngest
# And I see that the list of actors only includes actors that are currently working

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

    it 'lists titles of studio movies' do
      visit "/studios/#{@studio.id}"

      expect(page).to have_content("All Movies:")
      expect(page).to have_content("* #{@raiders.title}")
      expect(page).to have_content("* #{@howl.title}")
      expect(page).to have_content("* #{@snow_white.title}")
    end
  end 
end