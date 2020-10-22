# frozen_string_literal: true

# The Oystercard class has a balance
class Oystercard
  MAX_BALANCE = 90
  MININUM_BALANCE = 1
  MININUM_FARE = 1

  attr_reader :balance, :journey, :entry_station

  def initialize
    @balance = 0
    @journey = false
    @entry_station = nil
  end

  def top_up(amount)
    raise "Maximum balance #{MAX_BALANCE} exceeded" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station)
    raise "Minimum balance is #{MININUM_BALANCE} for entry" if @balance < MININUM_BALANCE

    @entry_station = station
    @journey = true

  end

  def touch_out
    @entry_station = nil
    @journey = false
    deduct(MININUM_FARE)
  end

  def in_journey?
    @journey
  end
end
