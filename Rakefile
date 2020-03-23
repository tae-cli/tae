# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard'
require 'yard/rake/yardoc_task'

# rake rubocop
# rake rubocop:auto_correct
RuboCop::RakeTask.new

# rake spec
RSpec::Core::RakeTask.new(:spec)

# rake yard
YARD::Rake::YardocTask.new

task default: :spec
