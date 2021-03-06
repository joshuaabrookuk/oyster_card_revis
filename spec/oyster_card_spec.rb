# frozen_string_literal: true

require 'oyster_card'

describe Oystercard do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:station) { Station.new('Waterloo',1) }
  let(:journey) { Journey.new(station) }
  let(:subject) { Oystercard.new(journey) }
  it 'should have MAX_BALANCE const at 90 by default' do
    expect(Oystercard::MAX_BALANCE).to eq 90
  end

  describe '#initialize' do
    xit 'should initialize with balance at 0' do
      expect(subject.balance).to eq 0
    end

    xit 'should initialize with entry_station set to nil' do
      expect(subject.entry_station).to eq nil
    end

    xit 'should initialize journeys as an empty hash' do
      expect(subject.journeys).to eq []
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

  it { should respond_to(:touch_in).with(1).arguments }

  describe '#touch_in' do
    it 'should set #in_journey? to true' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq true
    end

    it 'should raise an error if #balance < MININUM_BALANCE' do
      expect { subject.touch_in(entry_station) }.to raise_error "Minimum balance is #{Oystercard::MININUM_BALANCE} for entry"
    end

    it 'should remmeber the entry_station' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

    it 'should forget the previous exit_station' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      subject.touch_out(entry_station)
      subject.touch_in(exit_station)
      expect(subject.exit_station).to eq nil
    end
  end

  it { should respond_to(:touch_out).with(1).arguments }

  describe '#touch_out' do
    it 'should set #in_journey? to false' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end

    it 'should deduct the MININUM_FARE' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MININUM_FARE)
    end

    it 'should forget the entry_station' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end

    it 'should accept an exit_station' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
  end

  it { should respond_to :journeys }

  describe '#journey' do
    it 'stores a hash of entry/exit_station' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to eq [journey]
    end
  end
end
