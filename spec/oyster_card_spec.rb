# frozen_string_literal: true

require 'oyster_card'

describe Oystercard do
  it { should respond_to :balance }

  it { should respond_to(:top_up).with(1).arguments }

  describe '#top_up' do
    it 'should add the ammount to #balance' do
      subject.top_up(20)
      expect(subject.balance).to eq 20
    end
  end 
end
