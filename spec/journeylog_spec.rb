require 'journeylog'

describe JourneyLog do

  describe '#start' do

    it "should respond to start method" do
      entry_station = "station"
      expect(subject).to respond_to :start_journey
    end
  end

    it "should store the entry station in a journey hash" do
      entry_station = "station"
      subject.start_journey(entry_station)
      expect(subject.journey_list).to eq([{"station" => nil}])
    end
end
