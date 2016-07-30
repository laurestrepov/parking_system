class VehicleMailer < ApplicationMailer
  default from: 'notifications@placeyowheels.com'

  def new_vehicle_email(user, vehicle)
    @user = user
    @vehicle = vehicle
    if Rails.env == 'development'
      @url  = "http://localhost:3000/users/#{@user.id}/vehicles"
    elsif Rails.env == 'production'
      @url  = "http://place-yo-wheels.herokuapp.com/users/#{@user.id}/vehicles"
    end

    mail(to: @user.email, subject: 'New Vehicle Registered.')
  end

end
