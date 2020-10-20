# frozen_string_literal: true

# The Oystercard class has a balance
class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Maximum balance #{MAX_BALANCE} exceeded" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
