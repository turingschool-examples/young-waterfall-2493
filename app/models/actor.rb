class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.search_by_name(name)
    self.where('name = ?', name).limit(1)
  end

  def self.sorted_unique_working_actors_by_studio(studio_id)
    self.joins(movies: :studio).distinct.where('currently_working = true').where('studio_id = ?', studio_id).order(age: :desc)
  end

  def coactors
  end 
end
