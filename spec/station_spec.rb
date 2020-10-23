# frozen_string_literal: true

require 'station'

describe Station do

  subject {described_class.new(name: "Old Street", zone: 1)}

  it { should respond_to :name }

  it { should respond_to :zone }
end
