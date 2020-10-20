# frozen_string_literal: true

# The Oystercard class has a balance
class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance, :journey

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(amount)
    raise "Maximum balance #{MAX_BALANCE} exceeded" if @balance + amount > MAX_BALANCE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
   end

  def in_journey?
    @journey
  end
end
