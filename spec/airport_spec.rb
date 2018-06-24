require "airport"

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe "#land" do
    # it { is_expected.to respond_to(:land).with(1).argument }
    it "instruct a plane to land" do
      expect(airport).to respond_to(:land).with(1).argument
    end

    context "when full" do
      it "raise an error" do
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
      end
    end

  end

  describe "#take_off" do
    it "instruct a plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end

end
