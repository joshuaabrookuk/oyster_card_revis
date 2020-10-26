# frozen_string_literal: true

# The Journey class has methods extracted from Oystercard
class Journey
  PENALTY_FARE = 1

attr_reader :entry_station

  def initialize(station)
    @entry_station = station
  end

  def complete?
  end

  def fare
    PENALTY_FARE
  end

  def finish(station)
    self
  end














end
