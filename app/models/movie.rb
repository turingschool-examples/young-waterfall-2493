class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actor, dependent: :destroy
  has_many :actor, through: :movie_actor

  def non_appearing
    Actor.all - self.actor
  end
end
