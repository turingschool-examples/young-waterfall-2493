class Movie < ApplicationRecord
  belongs_to :studio
  has_many :different_roles
  has_many :actors, through: :different_roles
end
