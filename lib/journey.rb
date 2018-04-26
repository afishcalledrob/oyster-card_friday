class Journey
attr_reader :entry_station, :exit_station, :journey_hash

  def start(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
    @journey_hash = Hash.new
    @journey_hash[@entry_station] = @exit_station
  end

  def fare
  end

  def complete?
  end
end
