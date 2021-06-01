class Actor < ApplicationRecord
  has_many :movie_actor, dependent: :destroy
  has_many :movie, through: :movie_actor

  def self.actor_list_special(studio)
    joins(movie: :studio).where(currently_working: true).order(age: :desc).distinct
  end
end
