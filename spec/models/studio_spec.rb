require 'rails_helper'

RSpec.describe Studio do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :location}
  end

  describe 'relationships' do
    it {should have_many :movies}
    it {should have_many(:movie_actors).through(:movies)}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'methods' do
    it 'studio_actors returns actors who have filmed in that studio' do
      @mgm = Studio.create!(name: "MGM", location: "Los Angeles")
      @shawshank = @mgm.movies.create!(title: "The Shawshank Redemption", creation_year: 1994, genre: "Drama")
      @eli = @mgm.movies.create!(title: "The Book of Eli", creation_year: 2010, genre: "Action/Fiction")
      @freeman = @shawshank.actors.create(name: "Morgan Freeman", age: 84, currently_working: true)
      @robbins = @shawshank.actors.create(name: "Tim Robbins", age: 62, currently_working: true)
      @washington = @eli.actors.create(name: "Denzel Washington", age: 66, currently_working: true)
      @kunis = @eli.actors.create(name: "Mila Kunis", age: 37, currently_working: true)
      expect(@mgm.studio_actors.count).to eq(4)
    end
  end
end
