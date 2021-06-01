# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActorMovie.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all

universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
focus = Studio.create!(name: 'Focus Films', location: 'London')
lucas = Studio.create!(name: 'Lucasfilm Ltd', location: 'San Francisco')

raiders = universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Adventure')
princess = focus.movies.create!(title: 'The Princess Bride', creation_year: 1987, genre: 'Romance')
empire = lucas.movies.create!(title: 'The Empire Strikes Back', creation_year: 1980, genre: 'Adventure')
jedi = lucas.movies.create!(title: 'Return of the Jedi', creation_year: 1983, genre: 'Adventure')

hamill = Actor.create!(name: 'Mark Hamill', age: 69, working: true)
elwes = Actor.create!(name: 'Cary Elwes', age: 58, working: true)
ford = Actor.create!(name: 'Harrison Ford', age: 78, working: false)

ActorMovie.create!(actor: ford, movie: empire)
ActorMovie.create!(actor: hamill, movie: empire)
ActorMovie.create!(actor: ford, movie: jedi)
ActorMovie.create!(actor: hamill, movie: jedi)
ActorMovie.create!(actor: elwes, movie: princess)
ActorMovie.create!(actor: ford, movie: princess)  ##
ActorMovie.create!(actor: ford, movie: raiders)
