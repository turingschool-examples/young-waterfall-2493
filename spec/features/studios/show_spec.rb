require "rails_helper"

RSpec.describe "studios show page", type: :feature do
   before :each do
      @studio1 = Studio.create!(name: "Bobby", location: "Los Angeles")
      @studio2 = Studio.create!(name: "Jojo", location: "Miami")
      @movie1 = Movie.create!(title: "Night of the Living Dead", creation_year: "1987", genre: "Horror", studio_id: @studio1.id)
      @movie2 = Movie.create!(title: "Land of the dead", creation_year: "2010", genre: "Horror", studio_id: @studio1.id)
      @movie3 = Movie.create!(title: "Nuggets vs Clippers", creation_year: "2021", genre: "Sports", studio_id: @studio2.id)
      @movie4 = Movie.create!(title: "Jersey Shore the Movie", creation_year: "2012", genre: "Drama", studio_id: @studio2.id)
      @actor1 = Actor.create!(name: "Harrison Ford", age: 78, currently_working: true)
      @actor2 = Actor.create!(name: "John Leguizamo", age: 56, currently_working: true)
      @actor3 = Actor.create!(name: "Simon Baker", age: 51, currently_working: true)
      @actor4 = Actor.create!(name: "Arnold Schwarzenegger", age: 73, currently_working: false)
      @actor5 = Actor.create!(name: "Sean Connery", age: 90, currently_working: false)
      @actor6 = Actor.create!(name: "Pierce Brosnan", age: 68, currently_working: true)
      @role1 = DifferentRole.create!(movie_id: @movie1.id, actor_id: @actor4)
      @role2 = DifferentRole.create!(movie_id: @movie1.id, actor_id: @actor6)
      @role11 = DifferentRole.create!(movie_id: @movie1.id, actor_id: @actor3)
      @role3 = DifferentRole.create!(movie_id: @movie2.id, actor_id: @actor3)
      @role4 = DifferentRole.create!(movie_id: @movie2.id, actor_id: @actor4)
      @role5 = DifferentRole.create!(movie_id: @movie3.id, actor_id: @actor6)
      @role6 = DifferentRole.create!(movie_id: @movie3.id, actor_id: @actor5)
      @role7 = DifferentRole.create!(movie_id: @movie3.id, actor_id: @actor4)
      @role8 = DifferentRole.create!(movie_id: @movie4.id, actor_id: @actor3)
      @role9 = DifferentRole.create!(movie_id: @movie4.id, actor_id: @actor5)
      @role10 = DifferentRole.create!(movie_id: @movie4.id, actor_id: @actor1)
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
    # As a user,
    # When I visit a studio show page
    # I see a list of actors that have acted in any of the studio's movies
    # And I see that the list of actors is unique (no duplicate actors)
    # And I see that the list of actors is ordered from oldest actor to youngest
    # And I see that the list of actors only includes actors that are currently working
    it 'can list all actors and no duplicate names in the movies' do
      
      expect(page).to have_content(@actor3.name)
      expect(page).to have_content(@actor6.name)
      expect(page).to have_content(@actor4.name)
    end
end