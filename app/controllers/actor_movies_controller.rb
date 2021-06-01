class ActorMoviesController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.find(params[:actor_id])
    ActorMovie.create!(actor: actor, movie: movie)
    redirect_to "/movies/#{movie.id}"
  end

  # def create
  #   mechanic = Mechanic.find(params[:mechanic_id])
  #   ride = Ride.find(params[:ride_id])
  #   RideMechanic.create(ride: ride, mechanic: mechanic)
  #   redirect_to "/mechanics/#{mechanic.id}"
  # end

end
