require "rails_helper"

RSpec.describe "studios show page", type: :feature do
   before :each do
      @studio1 = Studio.create!(name: "Bobby", location: "Los Angeles")
      @studio2 = Studio.create!(name: "Jojo", location: "Miami")
      @movie1 = Movie.create!(title: "Night of the Living Dead", creation_year: "1987", genre: "Horror", studio_id: @studio1.id)
      @movie2 = Movie.create!(title: "Land of the dead", creation_year: "2010", genre: "Horror", studio_id: @studio1.id)
      @movie3 = Movie.create!(title: "Nuggets vs Clippers", creation_year: "2021", genre: "Sports", studio_id: @studio2.id)
      @movie4 = Movie.create!(title: "Jersey Shore the Movie", creation_year: "2012", genre: "Drama", studio_id: @studio2.id)
      @actor1 = Actor.create!
      @actor2 = Actor.create!
      @actor3 = Actor.create!
      @actor4 = Actor.create!
      @actor5 = Actor.create!
      @actor6 = Actor.create!
      visit "/studios/#{@studio1.id}"
   end

  describe "user sees a studios Individual page" do
    it "displays the studio name and location with the titles associated with that studio" do

        expect(page).to have_content(@studio1.name)
        expect(page).to have_content(@studio1.location)
        expect(page).to have_content(@movie1.title)
        expect(page).to have_content(@movie1.creation_year)
        expect(page).to have_content(@movie1.genre)
        expect(page).to have_content(@movie2.title)
        expect(page).to have_content(@movie2.creation_year)
        expect(page).to have_content(@movie2.genre)
    end 
  end

  describe "On a Studios show page can list the actors in the movies, no duplicate actors are used and listed from oldest to youngest with only actors currently working"
    xit 'can list all actors and no duplicate names in the movies' do
      
    end
end