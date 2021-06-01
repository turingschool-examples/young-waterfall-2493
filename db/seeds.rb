# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Actor.delete_all
Movie.delete_all
Studio.delete_all

require 'factory_bot_rails'
studio = Studio.create! FactoryBot::attributes_for(:studio)

actor1 = Actor.create! FactoryBot::attributes_for(:actor)
actor2 = Actor.create! FactoryBot::attributes_for(:actor)
actor3 = Actor.create! FactoryBot::attributes_for(:actor)

2.times do
  m = studio.movies.create! FactoryBot::attributes_for(:movie)
  actor1.movies << m
end
2.times do
  m = studio.movies.create! FactoryBot::attributes_for(:movie)
  actor2.movies << m
end
2.times do
  m = studio.movies.create! FactoryBot::attributes_for(:movie)
  actor3.movies << m
end
