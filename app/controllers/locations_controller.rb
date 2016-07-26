class LocationsController < ApplicationController
  def new
    @location = Location.new
  end


  def index
    @locations = Location.all
    flash[:error] = 'No locations registered.' if @locations.empty?
  end
end
