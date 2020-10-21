# frozen_string_literal: true

require 'oyster_card'

describe Oystercard do
  it 'should have MAX_BALANCE const at 90 by default' do
    expect(Oystercard::MAX_BALANCE).to eq 90
  end

  describe '#initialize' do
    it 'should initialize with balance at 0' do
      expect(subject.balance).to eq 0
    end

    it 'should initialize with journey as false' do
      expect(subject.journey).to eq false
    end
  end

  it { should respond_to :balance }

  it { should respond_to(:top_up).with(1).arguments }

  describe '#top_up' do
    it 'should add the amount to #balance' do
      subject.top_up(20)
      expect(subject.balance).to eq 20
    end

    it 'raises an error if #balance > MAX_BALANCE' do
      subject.top_up(90)
      expect { subject.top_up(1) }.to raise_error "Maximum balance #{Oystercard::MAX_BALANCE} exceeded"
    end
  end

  # describe '#deduct' do
  #   it 'should deduct the ammout from balance' do
  #     expect (subject.send(:deduct).with('1').arguments).to be_truthy
  #   end
  # end

  it { should respond_to :journey }

  it { should respond_to :touch_in }

  describe '#touch_in' do
    it 'should set #in_journey? to true' do
      subject.top_up(20)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end

    it 'should raise an error if #balance < MININUM_BALANCE' do
      expect { subject.touch_in }.to raise_error "Minimum balance is #{Oystercard::MININUM_BALANCE} for entry"
    end
  end

  it { should respond_to :touch_out }

  describe '#touch_out' do
    it 'should set #in_journey? to false' do
      subject.top_up(20)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'should deduct the MININUM_FARE' do
      subject.top_up(20)
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MININUM_FARE)
    end
  end
end
