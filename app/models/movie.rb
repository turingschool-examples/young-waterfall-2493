class Movie < ApplicationRecord
  belongs_to :studio
  validates_presence_of :title, :genre
  validates_presence_of :creation_year
end
