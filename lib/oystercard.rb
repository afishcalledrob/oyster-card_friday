require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :journeys

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @current_journey = Journey.new
    @journeys = []
  end

  def top_up(amount)
    raise 'Balance cannot exceed £90' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@current_journey.entry_station
  end

  def touch_in(entry_station)
    raise 'Card balance is too low' if @balance < MINIMUM_BALANCE
    @current_journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    @current_journey.end(exit_station)
    @journeys.push(@current_journey.journey_hash)
    @current_journey = Journey.new
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
