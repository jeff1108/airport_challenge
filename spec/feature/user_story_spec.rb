describe "All user stories" do
  let(:airport) { Airport.new(20, weather) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }

  context "when no stormy" do
    before do
      allow(weather).to receive(:stormy?).and_return false
    end
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    it "so plane land at airport, instruct a plane to land" do
      expect { airport.land(plane) }.not_to raise_error
    end
    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it "so plane take off from airpot, instruct a plane to take off" do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context "when the airport is full" do
      it "does not allow planes to land" do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
      end
    end
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing or takeing off when weather is stormy
  context "when the weather is stormy" do
    before do
      allow(weather).to receive(:stormy?).and_return true
    end

    it "does not allow plane to land" do
      expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
    end

    it "does not allow plane to take off" do
      expect { airport.take_off(plane) }.to raise_error "Cannot take off plane: weather is stormy"
    end
  end
end
