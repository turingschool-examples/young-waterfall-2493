# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
studio = Studio.create(name: 'Paramount', location: 'Iowa')
movie_1 = studio.movies.create(title: 'Man man', creation_year: '1876', genre: 'horror')
movie_2 = studio.movies.create(title: 'Future Shock', creation_year: '2021', genre: 'comedy')
actor_1 = Actor.create(name: 'Marison Hord', age: 26, currently_working: true)
actor_2 = Actor.create(name: 'MZuko', age: 16, currently_working: true)
MovieActor.create(movie: movie_1, actor: actor_1)
MovieActor.create(movie: movie_2, actor: actor_1)
MovieActor.create(movie: movie_2, actor: actor_2)
