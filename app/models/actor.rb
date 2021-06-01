class Actor < ApplicationRecord
  has_many :movie_actor, dependent: :destroy
  has_many :movie, through: :movie_actor
end
