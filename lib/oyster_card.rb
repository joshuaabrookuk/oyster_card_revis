# frozen_string_literal: true

require_relative 'journey'
require_relative 'station'
station = Station.new('Waterloo',1)
p journey = Journey.new(station)

# The Oystercard class has a balance
class Oystercard
  MAX_BALANCE = 90
  MININUM_BALANCE = 1
  MININUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize(station)
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
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

  def in_journey?
    !!@entry_station
  end

  private

  def push_journey
      @journeys << {
        entry_station: entry_station,
        exit_station: exit_station
      }
    end

  def deduct(amount)
    @balance -= amount
  end
end
