class AddColsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :max_slots, :float
    add_column :locations, :address, :string
  end
  
end
