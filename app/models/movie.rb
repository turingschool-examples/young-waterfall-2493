class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actor, dependent: :destroy
  has_many :actor, through: :movie_actor

  def non_appearing
    Actor.where('id not in (?)', self.actor_ids)
  end
end
