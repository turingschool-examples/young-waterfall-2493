require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :actors}
    it { should have_many(:actors).through(:movie_actors) }
  end
  it 'only shows actors that are currently working' do
    studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie_1 = studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    actor_1 = movie_1.actors.create!(name: 'Chris P. Bacon', age:54, currently_working: true)
    actor_2 = movie_1.actors.create!(name: 'Anita Nappe', age:87, currently_working: false)
    actor_3 = movie_1.actors.create!(name: 'Crystall Ball', age:34, currently_working: true)

    expect(movie_1.actors.all).to eq([actor_3, actor_1])
  end
end
