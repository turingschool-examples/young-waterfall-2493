class Studio < ApplicationRecord
  has_many :movies
  has_many :actors, through: :movies

  def actors_list
    actors.order(age: :desc).where('actors.working = ?', true).distinct
  end
end
