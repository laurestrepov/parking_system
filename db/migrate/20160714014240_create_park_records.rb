class CreateParkRecords < ActiveRecord::Migration
  def change
    create_table :park_records do |t|
      t.references :vehicle, index: true, foreign_key: true
      t.references :slot, index: true, foreign_key: true
      t.date :date_details
      t.string :comments

      t.timestamps null: false
    end
  end
end
