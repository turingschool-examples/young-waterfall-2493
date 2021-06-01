class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  default_scope { order(age: :desc) }

  
end