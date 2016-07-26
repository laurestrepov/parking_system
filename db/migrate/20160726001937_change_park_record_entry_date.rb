class ChangeParkRecordEntryDate < ActiveRecord::Migration
  def change
    change_column :park_records, :entry_date, :datetime
  end
end
