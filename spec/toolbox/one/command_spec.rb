# frozen_string_literal: true

require_relative '../../spec_helper'

require 'toolbox/one/command'

describe 'one' do
  subject(:c) do
    Toolbox::One::Command.new('blah', { dry: true, verbose: true })
  end

  let(:data) do
    [
      'host1:port1:type1',
      'host2:port2:type2',
      'host3:port3:type3'
    ]
  end

  let(:tmpl) { IO.read("#{File.dirname(__FILE__)}/resources/example.erb") }

  it '#call' do
    expect { c.call }
      .to output(/INFO -- : Command one with blah/)
      .to_stdout_from_any_process
  end

  it '#render' do
    expect(c.render(data, tmpl).split("\n")[1]).to eq('host="host2" port="port2" type="type2"')
  end
end
