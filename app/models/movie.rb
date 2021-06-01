class Movie < ApplicationRecord
  belongs_to :studio
  has_many :casts, dependent: :destroy
  has_many :actors, through: :casts
end
