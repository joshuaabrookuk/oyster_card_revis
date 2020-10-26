# frozen_string_literal: true

# The Journey class has methods extracted from Oystercard
class Journey
  attr_reader :entry_station, :exit_station, :journeys

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def in_journey?
    !!entry_station
  end

  def push_journey
    @journeys << {
      entry_station: entry_station,
      exit_station: exit_station
    }
  end
end
