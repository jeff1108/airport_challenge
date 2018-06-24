require "weather.rb"

class Airport

  def initialize(capacity, weather)
    @capacity = capacity
    # @number_of_planes_landed = 0
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Cannot land plane: airport full" if full?
    raise "Cannot land plane: weather is stormy" if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off plane: weather is stormy" if stormy?
  end

private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end
end
