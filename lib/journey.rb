# frozen_string_literal: true

# The Journey class has methods extracted from Oystercard
class Journey
  PENALTY_FARE = 6
  FARE = 1

  attr_reader :entry_station, :exit_station

  def initialize(station)
    @entry_station = station
    @exit_station = nil
  end

  def complete?
    if !@exit_station.nil?
      true
    else
      false
    end
  end

  def fare
    if @exit_station.nil?
      PENALTY_FARE
    else
      FARE
    end
  end

  def finish(station)
    @exit_station = station

    self
  end
end
