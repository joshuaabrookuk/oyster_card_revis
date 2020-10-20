# frozen_string_literal: true

# The Oystercard class has a balance
class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount
  end
end
