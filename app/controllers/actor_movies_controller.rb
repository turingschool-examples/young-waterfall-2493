class ActorMoviesController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.find(params[:actor_id])
    ActorMovie.create!(actor: actor, movie: movie)
    redirect_to "/movies/#{movie.id}"
  end

end
