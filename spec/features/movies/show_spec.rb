require 'rails_helper'

RSpec.describe "Movie Show Page" do
  before :each do
    @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @mgm = Studio.create!(name: "MGM", location: "Los Angeles")
    @raiders = @universal.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure")
    @shawshank = @mgm.movies.create!(title: "The Shawshank Redemption", creation_year: 1994, genre: "Drama")
    @eli = @mgm.movies.create!(title: "The Book of Eli", creation_year: 2010, genre: "Action/Fiction")
    @ford = @raiders.actors.create(name: "Harrison Ford", age: 78, currently_working: true)
    @freeman = @shawshank.actors.create(name: "Morgan Freeman", age: 84, currently_working: true)
    @robbins = @shawshank.actors.create(name: "Tim Robbins", age: 62, currently_working: true)
    @washington = @eli.actors.create(name: "Denzel Washington", age: 66, currently_working: true)
    @kunis = @eli.actors.create(name: "Mila Kunis", age: 37, currently_working: true)
    @kunis_2 = @shawshank.actors.create(name: "Mila Kunis", age: 37, currently_working: true)
  end

  it 'displays movie title, creation year, genre and actors in movie' do
    visit "/movies/#{@eli.id}"
    expect(page).to have_content(@eli.title)
    expect(page).to have_content(@eli.creation_year)
    expect(page).to have_content(@eli.genre)
    expect(page).to have_content(@washington.name)
    expect(page).to have_content(@kunis.name)
    expect(page).to_not have_content(@robbins.name)
  end
end
