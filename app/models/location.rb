class Location < ActiveRecord::Base
  has_many :slots
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
