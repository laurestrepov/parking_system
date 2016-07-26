class RemoveDateDetailsFromParkRecords < ActiveRecord::Migration
  def change
    remove_column :park_records, :date_details, :string
  end
end
