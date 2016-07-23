class Location < ActiveRecord::Base
  has_many :slots
  validates :address, presence: true, numericality: true
  
end
