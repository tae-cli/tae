# typed: false
# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'tae version', type: :aruba do
  it 'Prints a version number' do
    run_command('tae version')
    expect(last_command_started).to have_output(/\d+\.\d+\.\d+/)
  end
end
