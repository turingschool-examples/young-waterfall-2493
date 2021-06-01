class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def coactors
    ids = movies.pluck(:id)
    Actor.joins(:movies).where('actor_movies.movie_id': ids).where.not('actor_movies.actor_id': id).distinct
  end
end
