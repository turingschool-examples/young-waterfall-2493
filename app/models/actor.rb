class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.acted_with
    self  #.joins(actor_movies).select('actors.*,') share same movie_ids
  end
end
