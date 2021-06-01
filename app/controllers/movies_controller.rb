class MoviesController < ApplicationController
  def show
    @movie = Movie.find params[:id]
  end

  def add_actor
    movie = Movie.find params[:id]
    movie.actors << Actor.find(params[:actor])
    redirect_to "/movies/#{movie.id}"
  end
end
