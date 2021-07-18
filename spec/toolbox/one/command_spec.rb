# frozen_string_literal: true

require_relative '../../spec_helper'

require 'toolbox/one/command'

describe 'one' do
  subject(:c) do
    Toolbox::One::Command.new('blah', { dry: true, verbose: true })
  end

  it '#call' do
    expect(c.call).to eq(true)
  end
end
