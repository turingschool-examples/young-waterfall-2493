class Movie < ApplicationRecord
  validates_presence_of :title, :genre
  validates_presence_of :creation_year
  belongs_to :studio
end
