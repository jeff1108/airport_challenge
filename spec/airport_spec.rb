require "airport"

describe Airport do
  subject(:airport) { described_class.new(20) }
  let(:plane) { double :plane }

  describe "#land" do
    context "when not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      # it { is_expected.to respond_to(:land).with(1).argument }
      it "instruct a plane to land" do
        # allow(airport).to receive(:stormy?).and_return false
        expect(airport).to respond_to(:land).with(1).argument
      end

      context "when full" do
        it "raise an error" do
          # allow(airport).to receive(:stormy?).and_return false
          20.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full"
        end
      end
    end

    context "when stormy" do
      it "raise an error if asked to land a plane when stormy" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
      end
    end
  end

  describe "#take_off" do
    it "instruct a plane to take off" do
      expect(airport).to respond_to(:take_off).with(1).argument
    end
  end
end
