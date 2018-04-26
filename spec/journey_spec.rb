require 'journey'

describe Journey do
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  describe '#start' do
  it "responds to the method 'start'" do
    expect(subject).to respond_to(:start)
  end

  it "stores entry station as attribute variable" do
    subject.start(entry_station)
    expect(subject.entry_station).to eq(entry_station)
  end

  it "stores entry station as key in hash with nil value" do
    subject.start(entry_station)
    expect(subject.journey_hash).to eq({entry_station => nil})
  end
 end

 describe '#end' do
 it "responds to the method 'end'" do
   expect(subject).to respond_to(:end)
 end

 it "stores exit station as attribute variable" do
   subject.start(entry_station)
   subject.end(exit_station)
   expect(subject.exit_station).to eq(exit_station)
 end

 it 'stores entry and exit stations in a journey_hash' do
   subject.start(entry_station)
   subject.end(exit_station)
   expect(subject.journey_hash).to eq({entry_station => exit_station})
 end
end

describe '#fare' do
  it "responds to the method 'fare'" do
    expect(subject).to respond_to(:fare)
  end

  it "returns minimum fare for standard journey" do
    subject.start(entry_station)
    subject.end(exit_station)
    expect(subject.fare).to eq(Oystercard::MINIMUM_BALANCE)
  end

  it "returns penalty fare for journey with no touch in" do
    subject.end(exit_station)
    expect(subject.fare).to eq(6)
  end

end

describe '#complete?' do
  it "responds to the method 'complete?'" do
    expect(subject).to respond_to(:complete?)
  end

  it "returns true if journey is complete" do
    subject.start(entry_station)
    subject.end(exit_station)
    expect(subject.complete?).to eq true
  end

  it "returns false if journy is incomplete" do
    subject.start(entry_station)
    expect(subject.complete?).to eq false
  end

end
end
