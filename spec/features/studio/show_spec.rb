require 'rails_helper'

RSpec.describe 'Show Page' do
  it "finds actors for this studio" do
    studio = Studio.create! attributes_for(:studio)
    movie1 = studio.movies.create! attributes_for(:movie)
    movie2 = studio.movies.create! attributes_for(:movie)
    actor1 = Actor.create! name: 'Actor 1', age: 20, currently_working: true
    actor2 = Actor.create! name: 'Actor 2', age: 21, currently_working: false
    actor3 = Actor.create! name: 'Actor 3', age: 22, currently_working: true
    actor1.movies << [movie1, movie2]
    actor2.movies << [movie1, movie2]
    actor3.movies << [movie1, movie2]

    visit "/studios/#{studio.id}"
    expect(page).to have_content(actor1.name, count: 1)
    expect(page).to have_content(actor3.name, count: 1)
    expect(page).to_not have_content(actor2.name)
    expect(actor3.name).to appear_before(actor1.name)
  end
end
