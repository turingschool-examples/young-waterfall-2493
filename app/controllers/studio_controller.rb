class StudioController < ApplicationController
  def show
    @studio = Studio.find(params[:id]) 
  end    
end