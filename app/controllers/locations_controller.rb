class LocationsController < ApplicationController
  def new
    @location = Location.new
  end
  def index
    @locations = Location.all #consulta de todos los registros del modelo
    flash[:error] = 'No locations registered.' if @locations.empty?
  end
end
