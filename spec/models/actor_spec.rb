require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:casts) }
    it { should have_many(:movies).through(:casts) }
  end

  before :each do 
    @studio = Studio.create!(name: "Colby Studios", location: "Boston")
    @raiders = @studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981 , genre: 'Action/Adventure')
    @howl = @studio.movies.create!(title: "Howl's Moving Castle", creation_year: 2004 , genre: 'Fantasy')
    @snow_white = @studio.movies.create!(title: 'Snow White and the Seven Dwarves', creation_year: 1960 , genre: 'Fairytale')
    @jacob = Actor.create!(name: "Jacob Ordy", age: 13, currently_working: true)
    @allison = Actor.create!(name: "Allison Ray", age: 24, currently_working: true)
    @misha = Actor.create!(name: "Misha Ye", age: 32, currently_working: false)
    @beth = Actor.create!(name: "Beth Wise", age: 55, currently_working: true)
    @bill = Actor.create!(name: "Bill Wise", age: 63, currently_working: true)
    Cast.create!(actor: @jacob, movie: @raiders)
    Cast.create!(actor: @allison, movie: @raiders)
    Cast.create!(actor: @misha, movie: @howl)
    Cast.create!(actor: @beth, movie: @howl)
    Cast.create!(actor: @beth, movie: @snow_white)
    Cast.create!(actor: @bill, movie: @snow_white)
  end


  it '::currently working actors' do

    expect(Actor.cast_in_studio_movies).to eq([@bill, @beth, @allison, @jacob])
  end
end
