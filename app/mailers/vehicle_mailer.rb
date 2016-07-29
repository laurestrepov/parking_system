class VehicleMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_vehicle_email(user, vehicle)
    @user = user
    @vehicle = vehicle
    @url  = “http://localhost:3000/users/#{@user.id}/vehicles”
    mail(to: @user.email, subject: 'New Vehicle Registered.')
  end

end
