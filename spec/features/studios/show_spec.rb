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
      @jacob = Actor.create!(name: "Jacob Ordy", age: 13, currently_working: true)
      @allison = Actor.create!(name: "Allison Ray", age: 24, currently_working: true)
      @misha = Actor.create!(name: "Misha Ye", age: 32, currently_working: false)
      @beth = Actor.create!(name: "Beth Wise", age: 55, currently_working: true)
      @bill = Actor.create!(name: "Bill Wise", age: 63, currently_working: true)
      Cast.create!(actor: @jacob, movie: @raiders)
      Cast.create!(actor: @allison, movie: @raiders)
      Cast.create!(actor: @misha, movie: @howl)
      Cast.create!(actor: @beth, movie: @howl)
      Cast.create!(actor: @beth, movie: @snow_white)
      Cast.create!(actor: @bill, movie: @snow_white)
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

    it 'lists currently working actors that have acted in any studio movie' do
      visit "/studios/#{@studio.id}"

      expect(page).to have_content("Current Studio Actors")
      expect(page).to have_content("#{@allison.name}")
      expect(page).to have_content("#{@beth.name}")
      expect(page).to have_content("#{@bill.name}")
      expect(page).to have_content("#{@jacob.name}")
      expect(page).to_not have_content("#{@misha.name}")
    end

    it 'lists actors in order from oldest to youngest' do
      visit "/studios/#{@studio.id}"

      expect("#{@bill.name}").to appear_before("#{@beth.name}")
      expect("#{@beth.name}").to appear_before("#{@allison.name}")
      expect("#{@beth.name}").to appear_before("#{@jacob.name}")
      expect("#{@allison.name}").to appear_before("#{@jacob.name}")
    end
  end
end