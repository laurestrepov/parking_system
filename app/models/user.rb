class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :vehicles
    validates :first_name, presence: true, format:{ with: /\A[A-Z]+\z/,
    message: "Sólo se permiten letras" }
    validates :last_name, presence: true, format:{ with: /\A[A-Z]+\z/,
    message: "Sólo se permiten letras" }
    #validates_timeliness :birthdate
    validates_date :birthdate, :on_or_before => lambda { Date.current }
    validates :email, presence: true, uniqueness: true, format:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
