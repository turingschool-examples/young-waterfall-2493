class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actor, dependent: :destroy
  has_many :actor, through: :movie_actor
end
