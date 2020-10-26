# frozen_string_literal: true

# The Oystercard class has a balance
class Oystercard
  MAX_BALANCE = 90
  MININUM_BALANCE = 1
  MININUM_FARE = 1
  
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance #{MAX_BALANCE} exceeded" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def touch_in(station)
    raise "Minimum balance is #{MININUM_BALANCE} for entry" if @balance < MININUM_BALANCE

    @exit_station = nil
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    push_journey
    @entry_station = nil
    deduct(MININUM_FARE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
