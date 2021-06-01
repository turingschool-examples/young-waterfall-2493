class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    if !params[:add_actor].nil?
      @movie.actors << Actor.search_by_name(params[:add_actor])
    end
    @actors = @movie.actors
  end
end
