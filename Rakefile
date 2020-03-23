# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yaml'
require 'yard'
require 'yard/rake/yardoc_task'
require 'yardstick/rake/verify'
require 'yard-junk/rake'

# rake rubocop - lint
# rake rubocop:auto_correct - fix linting
RuboCop::RakeTask.new

# rake spec - run tests
RSpec::Core::RakeTask.new(:spec)

# rake docs
namespace :docs do

  YARD::Rake::YardocTask.new(:build)

  YardJunk::Rake.define_task

  yardstick_config = YAML.load_file('.yardstick.yml')
  Yardstick::Rake::Verify.new(:verify, yardstick_config)

  task :all => [:build, 'yard:junk', :verify]
end
desc 'Generate and verify the docs'
task docs: 'docs:all'

task default: [:spec, 'docs:build', 'docs:yard:junk', 'docs:verify']
