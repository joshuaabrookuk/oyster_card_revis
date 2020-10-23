# frozen_string_literal: true

# The Station class has a name and zone number
class Station
  attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
