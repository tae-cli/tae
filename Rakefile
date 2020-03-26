# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yaml'
require 'yard'
require 'yard/rake/yardoc_task'
require 'yardstick/rake/measurement'
require 'yard-junk/rake'

desc 'Run static type checking with sorbet'
task :sorbet do
  sh 'bundle exec srb tc'
end

# rubocop
RuboCop::RakeTask.new

# test suites
namespace :spec do
  require 'simplecov'

  desc 'Unit tests'
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**/*spec.rb'
    ENV['TEST_SUITE'] = 'unit'
    ENV['MINIMUM_COVERAGE'] = '90'
  end

  desc 'Offline integration tests w/ mocked external dependencies'
  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/integration/**/*spec.rb'
    ENV['TEST_SUITE'] = 'integration'
    ENV['MINIMUM_COVERAGE'] = '70'
  end

  desc 'e2e and online integration tests'
  RSpec::Core::RakeTask.new(:functional) do |t|
    t.pattern = 'spec/functional/**/*spec.rb'
    ENV['TEST_SUITE'] = 'functional'
    ENV['MINIMUM_COVERAGE'] = '50'
  end

  desc 'Run all test suites'
  task all: %i[unit integration functional]
end
desc 'Run all test suites'
task spec: 'spec:all'

# generate docs with yard and verify/lint
namespace :docs do
  report_file = 'tmp/yardstick-report.txt'

  YARD::Rake::YardocTask.new(:build)

  YardJunk::Rake.define_task

  yardstick_config = YAML.load_file('.yardstick.yml')
  Yardstick::Rake::Measurement.new(:verify, yardstick_config) do |t|
    t.output = report_file
    puts 'Verifying documentation with Yardstick'
  end

  desc 'Run Yardstick then print the output'
  task report: [:verify] do
    File.open(report_file) do |f|
      f.each_line { |l| puts l }
    end
  end

  desc 'Generate and verify the docs'
  task all: [:build, :report, 'yard:junk']
end
desc 'Generate and verify the docs'
task docs: 'docs:all'

# run all the checks locally
desc 'Run all ci checks in order'
task ci: %i[sorbet rubocop spec docs]

task default: :ci
