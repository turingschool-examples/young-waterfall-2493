require 'rails_helper'

# Story 1
# Studio Show
 
# As a user,
# When I visit a studio show page
# I see the studio's name and location
# And I see the titles of all of its movies

RSpec.describe 'studio show page' do
  describe 'display' do
    it 'show studio and attributes' do
      studio = Studio.create!(name: "Colby Theater", location: "Boston")
      
      visit "/studios/#{studio.id}"

      expect(page).to have_content("#{studio.name}")
      expect(page).to have_content("#{studio.location}")
    end
  end 
end