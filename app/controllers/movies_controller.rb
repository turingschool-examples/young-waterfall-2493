class MoviesController < ApplicationController
  def show
    @movie= Movie.find(params[:id])
    @actors = @movie.actor
  end
end
