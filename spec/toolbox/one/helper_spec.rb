# frozen_string_literal: true

require_relative '../../spec_helper'

require 'toolbox/one/helper'

describe 'helper' do
  include Toolbox::One::Helper
  let(:data) do
    [
      'host1:port1:type1',
      'host2:port2:type2',
      'host3:port3:type3'
    ]
  end

  let(:tmpl) { IO.read("#{File.dirname(__FILE__)}/resources/example.erb") }
  it 'render_tmpl' do
    expect(render_tmpl(data, tmpl).split("\n")[1]).to eq('host="host2" port="port2" type="type2"')
  end
end
