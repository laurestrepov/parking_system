class SlotPresenter
  delegate :name, :address, to: :location
  attr_accessor :location

  def initialize(location)
    @location = location
  end

  def slots
    @slots ||= @location.slots
  end

  def slots?
    slots.any?
  end

  def slots_count
    slots.count
  end

  def slot_grid

  end

  def slots_distribution
    return @slots_distribution unless @slots_distribution.nil? || @slots_distribution.empty?
  end

end
