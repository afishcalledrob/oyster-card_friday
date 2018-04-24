require 'oystercard'


describe Oystercard do
let(:entry_station) {double :entry_station}
let(:exit_station) {double :exit_station}

  describe '#top_up' do
    it 'should allow user to increase balance by a specified amount' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
    it 'should raise an error when top up results in balance > £90' do
      expect{ subject.top_up(91) }.to raise_error 'Balance cannot exceed £90'
    end
  end

  describe '#in_journey?' do
    it 'should not be in journey' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'should fail if card balance < £1' do
      expect{ subject.touch_in(entry_station) }.to raise_error 'Card balance is too low'
    end
    it 'should adjust status to in_journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq true
    end
    it 'should record entry station' do
      subject.top_up(10)
      expect(subject.touch_in(entry_station)).to eq entry_station
    end
  end

  describe '#touch_out' do
    it 'should adjust status to not_in_journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to eq false
    end
    it 'deduct minumum fare from balance' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
    end
    it 'should change the value of entry-station to nil' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#journeys' do
    it 'should be empty by default' do
      expect(subject.journeys).to eq({})
    end
    it 'checks that touching in and out creates one journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to eq ({entry_station => exit_station})
    end
  end

end
