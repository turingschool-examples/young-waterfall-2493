class Studio < ApplicationRecord
  has_many :movies, dependent: :destroy
end
