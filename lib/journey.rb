class Journey
attr_reader :entry_station, :exit_station, :journey_hash

  def start(entry_station)
    @entry_station = entry_station
    @journey_hash = Hash.new
    @journey_hash[@entry_station] = nil

  end

  def end(exit_station)
    @exit_station = exit_station
    @journey_hash = Hash.new
    @journey_hash[@entry_station] = @exit_station
  end

  def fare
    !complete? ? 6 : Oystercard::MINIMUM_BALANCE
  end
  
  def complete?
    @entry_station != nil && @exit_station != nil
  end
end
