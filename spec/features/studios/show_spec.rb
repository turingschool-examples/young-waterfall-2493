require 'rails_helper'

RSpec.describe "Studio Show Page" do
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

  it 'displays studio name, location, and movie titles' do
    visit "/studios/#{@mgm.id}"
    expect(page).to have_content(@mgm.name)
    expect(page).to have_content(@mgm.location)
    expect(page).to have_content(@shawshank.title)
    expect(page).to have_content(@eli.title)
  end

  describe 'displays actors associated with movies filmed at studio' do
    it 'and I see the list of actors is unique (no duplicates)' do
      visit "/studios/#{@mgm.id}"
      expect(@mgm.studio_actors).to eq(["#{@freeman.name}", "#{@washington.name}", "#{@robbins.name}", "#{@kunis.name}"])
      expect(page).to have_content(@mgm.studio_actors)
      # expect(page).to_not have_content(@kunis_2.name)
      # how to assert for no duplicates
      expect(@mgm.studio_actors.count).to eq(4)
    end

    it 'and the list is ordered from oldest actor to youngest' do
      visit "/studios/#{@mgm.id}"
      expect(@freeman.name).to appear_before(@washington.name)
      expect(@washington.name).to appear_before(@kunis.name)
      #remove ford from test once previous test corrected to only actors at studio
    end

    xit 'and the list includes only actors currently working' do
      visit "/studios/#{@mgm.id}"
      expect(page).to have_content(@freeman.name)
      expect(page).to have_content(@washington.name)
      expect(page).to have_content(@kunis.name)
      expect(page).to_not have_content(@robbins.name)
      # when given false for currently_working, not created in db
    end
  end
end
