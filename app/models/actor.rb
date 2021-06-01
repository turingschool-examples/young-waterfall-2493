class Actor < ApplicationRecord
  has_many :casts, dependent: :destroy
  has_many :movies, through: :casts

  def self.cast_in_studio_movies
    # select("actors.*, actors.name AS name")
    # .joins("LEFT OUTER JOIN casts ON casts.actor_id = actors.id")
    # .joins("LEFT OUTER JOIN movies ON casts.movie_id = movies.id")
    # .where('actors.currently_working = true')
    # .group('casts.id')
    # .order('actors.age DESC')

    Actor.find_by_sql("SELECT DISTINCT actors.*, actors.name AS name, actors.age AS age
                       FROM actors WHERE currently_working = true
                       ORDER BY age DESC")
               
  end
end