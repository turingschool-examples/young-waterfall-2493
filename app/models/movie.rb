class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def add_actor_options
    ids = actors.pluck(:id)
    Actor.where.not(id: ids).pluck(:name, :id)
  end
end
