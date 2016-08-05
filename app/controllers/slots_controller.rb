class SlotsController < ApplicationController
  def index
    @location = Location.find(params[:location_id])
    @s_presenter = SlotPresenter.new(@location)
    #@s_presenter.slot_grid

    @s_presenter.slots
    flash[:error] = 'No parking slots registered.' unless @s_presenter.slots?
  end

  def new
    @location = Location.find(params[:location_id])
    @slot = Slot.new
  end

  def create
    @location = Location.find(params[:location_id])
    begin
      Slot.transaction do
        @slots_to_create = params[:slots].to_i
        @slots_to_create.times do
          @slot = Slot.new(is_occupied: 0, location_id: @location.id)
          unless @slot.save && @location.update_attributes(max_slots: @location.max_slots - 1)
            raise ActiveRecord::Rollback, "Slot could not be created."
          end
        end
        flash[:success] = 'Slots created successfully.'
        redirect_to location_slots_path(@location)
      end
    rescue
      flash[:error] = "Some errors when creating slots."
      render 'new'
    end
  end


  def slot_params
    params.require(:slot).permit(:location_id, :id)
  end
  private :slot_params
end
