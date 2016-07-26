class RenameLocationLocationLatitudeToLatitude < ActiveRecord::Migration
  def change
    rename_column :locations, :location_latitude, :latitude
    rename_column :locations, :location_longitude, :longitude
  end
end
