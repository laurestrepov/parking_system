class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :park_records
  has_many :slots, through: :park_records

  validates :model, presence: true
  validates :year, presence: true
  validates :vin, presence: true
  
  scope :by_user, -> (user_id) { where("user_id = ?", "#{user_id}") }
  scope :by_id, -> (id) { where("id = ?", "#{id}") }

end
