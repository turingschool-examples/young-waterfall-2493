require 'rails_helper'

RSpec.describe 'movie show page' do
  before(:each)do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'Focus Films', location: 'London')
    @studio_3 = Studio.create!(name: 'Lucasfilm Ltd', location: 'San Francisco')

    @movie_1 = @studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Adventure')
    @movie_2 = @studio_2.movies.create!(title: 'The Princess Bride', creation_year: 1987, genre: 'Romance')
    @movie_3 = @studio_3.movies.create!(title: 'The Empire Strikes Back', creation_year: 1980, genre: 'Adventure')
    @movie_4 = @studio_3.movies.create!(title: 'Return of the Jedi', creation_year: 1983, genre: 'Adventure')

    @actor_1 = Actor.create!(name: 'Mark Hamill', age: 49, working: true) ##age was 69
    @actor_2 = Actor.create!(name: 'Cary Elwes', age: 58, working: true)
    @actor_3 = Actor.create!(name: 'Harrison Ford', age: 78, working: false)

    ActorMovie.create!(actor: @actor_3, movie: @movie_3)
    ActorMovie.create!(actor: @actor_1, movie: @movie_3)
    ActorMovie.create!(actor: @actor_3, movie: @movie_4)
    ActorMovie.create!(actor: @actor_1, movie: @movie_4)
    ActorMovie.create!(actor: @actor_2, movie: @movie_2)
    ActorMovie.create!(actor: @actor_3, movie: @movie_2)
    ActorMovie.create!(actor: @actor_3, movie: @movie_1)
    ActorMovie.create!(actor: @actor_2, movie: @movie_4)  ##differs from seeds

  end

  it 'has the title, creation year, genre of the movie' do
      visit "/movies/#{@movie_1.id}"
    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_1.creation_year)
    expect(page).to have_content(@movie_1.genre)
  end

  it 'has the names of all the movies actors' do
    visit "/movies/#{@movie_3.id}"
    expect(page).to have_content(@actor_1.name)
    expect(page).to have_content(@actor_3.name)
    expect(page).to_not have_content(@actor_2.name)
  end

  it 'has form to add an actor to the movie' do
    visit "/movies/#{@movie_1.id}"

    expect(page).to_not have_content(@actor_2.name)
    fill_in :actor_id, with: @actor_2.id
    click_on "Add Actor to Movie"

    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content(@actor_2.name)
  end

end
