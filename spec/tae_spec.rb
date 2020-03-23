# typed: false
# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

RSpec.describe Tae do
  it 'has a version number' do
    expect(Tae::VERSION).not_to be nil
  end
end
