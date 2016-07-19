class Slot < ActiveRecord::Base
  belongs_to :location
  has_many :park_records
  has_many :vehicles, through: :park_records
end
