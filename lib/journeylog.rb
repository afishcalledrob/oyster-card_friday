
class JourneyLog
  attr_reader :entry_station, :journey_list

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journey_list = []
  end

  def start_journey(entry_station)
    @entry_station = entry_station
    @journey_list << {@entry_station => nil}
  end

  def finish
  end


  def current_journey
      if @journey_list == [{@entry_station => nil}]
        return @journey_list
      else
      @journey_class = Journey.new
    end
  end
end
