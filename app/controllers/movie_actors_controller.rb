class MovieActorsController < ApplicationController

  def create
    require "pry"; binding.pry
    movie = Movie.find(params[:movie_id])
    actor = Actor.find(params[:actor][:id])
    MovieActor.create!(movie: movie, actor: actor)

    redirect_to "/movies/#{params[:movie_id]}"
  end

end
