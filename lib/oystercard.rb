class Oystercard
  attr_reader :balance, :entry_station

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise 'Balance cannot exceed £90' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey == true
  end

  def touch_in(entry_station)
    raise 'Card balance is too low' if @balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_BALANCE)
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
