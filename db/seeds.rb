# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all 

@studio = Studio.create!(name: "Colby Studios", location: "Boston")
@raiders = @studio.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981 , genre: 'Action/Adventure')
@howl = @studio.movies.create!(title: "Howl's Moving Castle", creation_year: 2004 , genre: 'Fantasy')
@snow_white = @studio.movies.create!(title: 'Snow White and the Seven Dwarves', creation_year: 1960 , genre: 'Fairytale')
@jacob = @howl.actors.create!(name: "Jacob Ordy", age: 13, currently_working: true)
@allison = @howl.actors.create!(name: "Allison Ray", age: 24, currently_working: true)
@misha = @raiders.actors.create!(name: "Misha Ye", age: 32, currently_working: false)
@beth = @raiders.actors.create!(name: "Beth Wise", age: 55, currently_working: true)
@beth_1 = @snow_white.actors.create!(name: "Beth Wise", age: 55, currently_working: true)
@bill = @snow_white.actors.create!(name: "Bill Wise", age: 63, currently_working: true)
