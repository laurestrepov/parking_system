class AddColsToParkRecord < ActiveRecord::Migration
  def change
    add_column :park_records, :entry_date, :date
  end
  
end
