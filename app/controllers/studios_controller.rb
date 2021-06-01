class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
    #@sorted_unique_working_actors = @studio.sorted_unique_working_actors
  end
end
