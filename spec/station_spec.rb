# frozen_string_literal: true

require 'station'

describe Station do

  it { should respond_to :name }

  it { should respond_to :zone }
end
