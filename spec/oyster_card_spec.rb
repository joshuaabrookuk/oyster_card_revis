# frozen_string_literal: true

require 'oyster_card'

describe Oystercard do
  it 'should have MAX_BALANCE const at 90 by default' do
    expect(Oystercard::MAX_BALANCE).to eq 90
  end

  it { should respond_to :balance }

  it { should respond_to(:top_up).with(1).arguments }

  describe '#top_up' do
    it 'should add the amount to #balance' do
      subject.top_up(20)
      expect(subject.balance).to eq 20
    end
  end
end
