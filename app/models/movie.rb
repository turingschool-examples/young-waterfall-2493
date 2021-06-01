class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def working_actors
    actors.where(currently_working: true)
  end
end
