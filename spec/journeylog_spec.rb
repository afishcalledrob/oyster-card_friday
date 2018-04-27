require 'journeylog'
require 'journey'

describe JourneyLog do
  let(:entry_station) { double :entry_station}

  describe '#start' do

    it "should respond to start method" do
      expect(subject).to respond_to :start_journey
    end
  end

    it "should store the entry station in a journey hash" do
      subject.start_journey(entry_station)
      expect(subject.journey_list).to eq([{entry_station => nil}])
    end

  describe '#current_journey' do
    let(:journey) { double :journey}
    let(:journey_class) { double :journey_class, new: journey}
    it 'should return an incomplete journey' do
      subject.start_journey(entry_station)
      expect(subject.current_journey).to eq([{entry_station => nil}])
    end
  end
    it 'should return a new instance of journey' do
      expect(subject.current_journey).to be_an_instance_of(Journey)
    end
end
