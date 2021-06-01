class Movie < ApplicationRecord
  belongs_to :studio
  has_many :blockbusters
  has_many :actors, through: :blockbusters
end
