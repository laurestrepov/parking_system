require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relations' do
    let(:first_name) { 'Mock' }
    let(:last_name) { 'User' }
    let(:password) { '123456' }
    let(:email) { 'mock_user@miemail.com' }
    let(:birthdate) { Date.new(1987, 12, 06) }

    let(:user) {
                  User.new(first_name: first_name,
                           last_name: last_name,
                           password: password,
                           email: email,
                           birthdate: birthdate)
                            }
    before do
      user.save
    end

    context 'when user has vehicles' do
      it 'returns related vehicles' do
        Vehicle.create(vin: 'MOCK879', year: 1998, model: 'Chrysler', user: user)
        expect(user.vehicles).not_to be_empty
      end
      it 'returns number of related vehicles' do
        Vehicle.create(vin: 'MOCK879', year: 1998, model: 'Chrysler', user: user)
        Vehicle.create(vin: 'AURM123', year: 2008, model: 'Chrysler', user: user)
        expect(user.vehicles.length).to eq 2
      end
    end
    context 'when user has no vehicles' do
      it 'returns no vehicles' do
        expect(user.vehicles).to be_empty
      end
    end
  end
  describe 'validations' do
    let(:first_name) { 'Mock' }
    let(:last_name) { 'User' }
    let(:password) { '123456' }
    let(:email) { 'mock_user@miemail.com' }
    let(:birthdate) { Date.new(2000, 12, 06) }

    context 'when user is created with a birthdate greater than today' do
      it 'does not allow saving the user' do
        birthdate = Date.new(2018, 12, 06)
        user =   User.new(first_name: first_name,
                          last_name: last_name,
                          password: password,
                          email: email,
                          birthdate: birthdate)
        expect { user.save }.not_to change(User, :count)
      end
    end

    context 'when user is created with a blank email' do
      it 'does not allow saving the user' do
        user =   User.new(first_name: first_name,
                          last_name: last_name,
                          password: password,
                          email: nil,
                          birthdate: birthdate)
        expect { user.save }.not_to change(User, :count)
      end
    end
  end
end
