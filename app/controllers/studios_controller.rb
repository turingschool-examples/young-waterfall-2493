class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
    @sorted_unique_working_actors = Actor.sorted_unique_working_actors_by_studio(@studio.id)
  end
end
