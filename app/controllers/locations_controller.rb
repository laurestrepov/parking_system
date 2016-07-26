class LocationsController < ApplicationController
  def new
    @location = Location.new
  end
<<<<<<< HEAD
  def index
    @locations = Location.all #consulta de todos los registros del modelo
=======

  def index
    @locations = Location.all
>>>>>>> heroku
    flash[:error] = 'No locations registered.' if @locations.empty?
  end
end
