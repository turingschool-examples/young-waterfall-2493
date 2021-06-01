class CastsController < ApplicationController 

  def create
    actor = Actor.find_by_name(params[:actor_name])
    movie = Movie.find(params[:movie_id])
    Cast.create(actor: actor, movie: movie)
    redirect_to "/movies/#{movie.id}"
  end
end