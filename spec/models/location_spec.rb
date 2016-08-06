require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'relations' do
    describe 'has_many slots' do
      context 'when location has slots' do
        let(:slot_1) { FactoryGirl.create(:slot) }
        let(:slot_2) { FactoryGirl.create(:slot) }
        let(:location) { FactoryGirl.create(:location, slots: [slot_1, slot_2]) }
        let(:slot_3) { FactoryGirl.create(:slot) }

        it 'returns related slots' do
          location_slots = location.slots
          expect(location_slots.first).to eq slot_1
          expect(location_slots.last).to eq slot_2
        end
        it 'returns only related slots' do
          location_slots = location.slots
          expect(location_slots).not_to include slot_3
        end
      end
      context 'when location has no slots' do
        let(:location) { FactoryGirl.create(:location) }
        it 'returns no slots' do
          expect(location.slots).to be_empty
        end
      end
    end
  end

  describe 'validations' do
    context 'when address is not present' do
      let(:location) { Location.new(address: nil) }
      it 'does not allow saving the location' do
        expect { location.save }.not_to change(Location, :count)
      end
    end
  end

  describe 'geocoding' do
    let(:location) { Location.create(address: 'El Tesoro, Medellín, Colombia') }
    context 'when location is created' do
      it 'set latitude' do
        expect(location.latitude).not_to be_nil
      end
      it 'set longitude' do
        expect(location.longitude).not_to be_nil
      end
    end
  end
end
