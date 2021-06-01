class StudiosController < ApplicationController
 def show
   @studio = Studio.find(params[:id])
   @studio_movies = @studio.movies
 end

  private

  def studio_params
    params.permit(:name, :location)
  end
end