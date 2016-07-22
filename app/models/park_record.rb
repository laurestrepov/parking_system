class ParkRecord < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :slot
  validates :entry_date, presence: true
end
