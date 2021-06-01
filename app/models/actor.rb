class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.search_by_name(name)
    self.where('name = ?', name)
  end
end
