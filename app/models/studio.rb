class Studio < ApplicationRecord
  has_many :movies

  def sorted_unique_working_actors
    self.movies!.joins(movies: :actors).distinct.where('currently_working = true').order(:age, 'desc')
  end
end
