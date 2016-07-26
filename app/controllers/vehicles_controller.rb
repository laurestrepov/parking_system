class VehiclesController < ApplicationController
  def new
    @user = current_user #usuario dueño del vehículo a current_password
    @vehicle = Vehicle.new #vehículo vacío que se llenará desde el form
  end

  def index
    #@user = User.find(params[:user_id])

    @vehicles = current_user.vehicles #@user.vehicles#
    flash[:error] = 'No vehicles registered.' if @vehicles.empty?
  end

  def create #recibe el POST del formulario
    @vehicle = Vehicle.new(vehicle_params) #pasarán al initialize de cada vehículo
    @vehicle.user_id = current_user.id
    if @vehicle.save #Si se guarda el vehiculo
      flash[:success] = 'Vehicle registered successfully.'
      redirect_to user_vehicles_path(current_user)
    else
      flash[:error] = @vehicle.errors.full_messages.join(',')
      render 'new'
    end
  end


  #Todo controlador debe tener: objeto_params
  def vehicle_params
    params.require(:vehicle).permit(:user_id, :model, :year, :vin, :id)
  end
  private :vehicle_params
end
