class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies
    @actors = Actor.actor_list_special
  end
end
