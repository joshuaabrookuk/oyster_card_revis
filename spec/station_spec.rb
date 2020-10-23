# frozen_string_literal: true

require 'station'

describe Station do

  describe '#initialize' do
    it 'should initialize with an empty name' do
      expect(subject.name).to eq ""
    end
  end

  it { should respond_to :name }
end
