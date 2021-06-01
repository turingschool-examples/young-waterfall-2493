require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before(:all) do
    @studio = Studio.create! attributes_for(:studio)
  end
  it "shows the movie and its actors" do
    movie = @studio.movies.create! attributes_for(:movie)
    actor1 = Actor.create! attributes_for(:actor)
    actor2 = Actor.create! attributes_for(:actor)
    movie.actors << [actor1, actor2]

    visit "/movies/#{movie.id}"
    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.creation_year)
    expect(page).to have_content(movie.genre)
    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
  end

  it "adds an actor" do
    movie = @studio.movies.create! attributes_for(:movie)
    actor1 = Actor.create! attributes_for(:actor)
    actor2 = Actor.create! attributes_for(:actor)
    movie.actors << actor1
    visit "/movies/#{movie.id}"
    within('#actors') do
      expect(page).to have_content(actor1.name)
      expect(page).to_not have_content(actor2.name)
    end

    select actor2.name, from: 'actor'
    click_on 'commit'
    expect(page).to have_current_path("/movies/#{movie.id}")
    within('#actors') do
      expect(page).to have_content(actor1.name)
      expect(page).to have_content(actor2.name)
    end

  end
end
