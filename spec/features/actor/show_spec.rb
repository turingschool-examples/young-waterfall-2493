require 'rails_helper'

RSpec.describe 'Actor Show Page' do
  before(:all) do
    @studio = Studio.create! attributes_for(:studio)
  end
  it "shows an actor and thier coactors" do
    movie = @studio.movies.create! attributes_for(:movie)
    actor1 = Actor.create! attributes_for(:actor)
    actor2 = Actor.create! attributes_for(:actor)
    movie.actors << [actor1, actor2]

    visit "/actors/#{actor1.id}"
    expect(page).to have_content(actor1.name)
    within('#coactors') do
      expect(page).to have_content(actor2.name)
    end

    visit "/actors/#{actor2.id}"
    expect(page).to have_content(actor2.name)
    within('#coactors') do
      expect(page).to have_content(actor1.name)
    end
  end
end
