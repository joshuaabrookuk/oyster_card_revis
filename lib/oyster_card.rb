# frozen_string_literal: true

require_relative 'journey'
require_relative 'station'

# The Oystercard class has a balance
class Oystercard
  MAX_BALANCE = 90
  MININUM_BALANCE = 1
  MININUM_FARE = 1
  attr_reader :balance, :entry_station, :journey, :journeys

  def initialize(journey)
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey = journey
  end

  def top_up(amount)
    raise "Maximum balance #{MAX_BALANCE} exceeded" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def touch_in(entry_station)
    raise "Minimum balance is #{MININUM_BALANCE} for entry" if @balance < MININUM_BALANCE

    journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    journey.finish(exit_station)
    # @exit_station = station
    push_journey
    # @entry_station = nil
    # deduct(MININUM_FARE)
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def push_journey
    @journeys << @journey
  end
end
