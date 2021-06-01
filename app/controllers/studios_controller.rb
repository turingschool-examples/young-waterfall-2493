class StudiosController < ApplicationController

  def show
    @studio = Studio.find(params[:id])
    @movies = @studio.movies.all
    # require 'pry'; binding.pry
  end
end