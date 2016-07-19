class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :park_records
  has_many :slots, through: :park_records
end
