class StudiosController < ApplicationController
  def show
    @studio = Studio.find(params[:id])
    @actors = @studio.actors
  end
end
