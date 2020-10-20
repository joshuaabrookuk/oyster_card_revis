# frozen_string_literal: true

require 'oyster_card'

describe Oystercard do
  it { should respond_to :balance }

  it { should respond_to(:top_up).with(1).arguments }
end
