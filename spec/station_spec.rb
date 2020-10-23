# frozen_string_literal: true

require 'station'

describe Station do
  let(:subject) { Station.new('Waterloo', 1) }

  describe 'initialize' do
    context 'when given a name parameter' do
      it 'takes the name it is given' do
        expect(subject.name).to eq 'Waterloo'
      end
      it 'takes the zone it is given' do
        expect(subject.zone).to eq 1
      end
    end
  end

  it { should respond_to :name }

  it { should respond_to :zone }
end
