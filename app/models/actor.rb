class Actor < ApplicationRecord
  has_many :different_roles
  has_many :movies, through: :different_roles
end