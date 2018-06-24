class Airport

  def initialize(capacity)
    @capacity = capacity
    # @number_of_planes_landed = 0
    @planes = []
  end

  def land(plane)
    raise "Cannot land plane: airport full" if full?
    @planes << plane
  end

  def take_off(plane)
  end

private

  def full?
    @planes.length >= @capacity
  end
end
