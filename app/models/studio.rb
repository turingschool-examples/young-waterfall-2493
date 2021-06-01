class Studio < ApplicationRecord
  validates_presence_of :name, :location
  has_many :movies

  def studio_actors
    Movie.joins(:actors).order(age: :desc).pluck(:name)
  end
end
