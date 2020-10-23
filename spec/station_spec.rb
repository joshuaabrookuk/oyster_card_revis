# frozen_string_literal: true

require 'station'

describe Station do

  describe '#initialize' do
    it 'should initialize with an empty name' do
      expect(subject.name).to eq ""
    end

    it 'should initialize with zone set to 0' do
      expect(subject.zone).to eq 0
    end
  end

  it { should respond_to :name }

  it { should respond_to :zone }
end
