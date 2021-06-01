class Studio < ApplicationRecord
  has_many :movies

  def actors
    Actor.joins(movies: :studio).where(currently_working: true).where('studios.id= ?', id).order(age: :desc).distinct
  end
end
