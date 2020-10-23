# frozen_string_literal: true

require 'station'

describe Station do

  describe 'initialize' do
    context 'when given a name parameter' do
      it 'takes the name it is given' do
        subject('Waterloo')
        expect(subject.name).to eq 'Waterloo'
      end
    end
  end

  it { should respond_to :name }

  it { should respond_to :zone }
end
