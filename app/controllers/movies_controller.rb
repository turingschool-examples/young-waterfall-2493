class MoviesController < ApplicationController

  def show
    @movie= Movie.find(params[:id])
    @actors = @movie.actor
    @free_actors = @movie.non_appearing
  end

end
