class Actor < ApplicationRecord
  has_many :blockbusters
  has_many :movies, through: :blockbusters    
end