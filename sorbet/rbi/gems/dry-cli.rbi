# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/dry-cli/all/dry-cli.rbi
#
# dry-cli-0.6.0

module Dry
  def self.CLI(registry_or_command = nil, &block); end
end
class Dry::CLI
  def anonymous_registry(&block); end
  def call(arguments: nil, out: nil, err: nil); end
  def command?(command); end
  def err; end
  def initialize(command_or_registry = nil, &block); end
  def kommand; end
  def out; end
  def parse(command, arguments, names); end
  def perform_command(arguments); end
  def perform_registry(arguments); end
  def registry; end
  def self.command?(command); end
  def usage(result); end
end
class Dry::CLI::Error < StandardError
end
class Dry::CLI::UnknownCommandError < Dry::CLI::Error
  def initialize(command_name); end
end
class Dry::CLI::InvalidCallbackError < Dry::CLI::Error
  def initialize(callback); end
end
class Dry::CLI::Option
  def alias_names; end
  def aliases; end
  def argument?; end
  def array?; end
  def boolean?; end
  def default; end
  def desc; end
  def description_name; end
  def initialize(name, options = nil); end
  def name; end
  def options; end
  def parser_options; end
  def required?; end
  def type; end
  def values; end
end
class Dry::CLI::Argument < Dry::CLI::Option
  def argument?; end
end
class Dry::CLI::Command
  def arguments(*args, &block); end
  def default_params(*args, &block); end
  def description(*args, &block); end
  def examples(*args, &block); end
  def optional_arguments(*args, &block); end
  def options(*args, &block); end
  def params(*args, &block); end
  def required_arguments(*args, &block); end
  def self.argument(name, options = nil); end
  def self.default_params; end
  def self.desc(description); end
  def self.example(*examples); end
  def self.inherited(base); end
  def self.option(name, options = nil); end
  def self.optional_arguments; end
  def self.params; end
  def self.required_arguments; end
  extend Forwardable
end
module Dry::CLI::Command::ClassMethods
  def arguments; end
  def description; end
  def examples; end
  def options; end
  def self.extended(base); end
end
class Dry::CLI::CommandRegistry
  def get(arguments); end
  def initialize; end
  def set(name, command, aliases); end
end
class Dry::CLI::CommandRegistry::Node
  def after_callbacks; end
  def alias!(key, child); end
  def aliases!(aliases); end
  def aliases; end
  def before_callbacks; end
  def children; end
  def command; end
  def initialize(parent = nil); end
  def leaf!(command); end
  def leaf?; end
  def lookup(token); end
  def parent; end
  def put(parent, key); end
end
class Dry::CLI::CommandRegistry::LookupResult
  def after_callbacks; end
  def arguments; end
  def before_callbacks; end
  def children; end
  def command; end
  def found?; end
  def initialize(node, arguments, names, found); end
  def names; end
end
class Dry::CLI::CommandRegistry::Chain
  def append(&callback); end
  def chain; end
  def initialize; end
  def run(context, *args); end
end
module Dry::CLI::Registry
  def _callback(callback, blk); end
  def after(command_name, callback = nil, &blk); end
  def before(command_name, callback = nil, &blk); end
  def command(command_name); end
  def get(arguments); end
  def register(name, command = nil, aliases: nil, &block); end
  def self.extended(base); end
end
class Dry::CLI::Registry::Prefix
  def initialize(registry, prefix, aliases); end
  def prefix; end
  def register(name, command, aliases: nil); end
  def registry; end
end
module Dry::CLI::ProgramName
  def self.call(names = nil, program_name: nil); end
end
module Dry::CLI::Parser
  def self.call(command, arguments, names); end
  def self.full_command_name(names); end
  def self.match_arguments(command_arguments, arguments); end
  def self.parse_required_params(command, arguments, names, parsed_options); end
end
class Dry::CLI::Parser::Result
  def arguments; end
  def error; end
  def error?; end
  def help?; end
  def initialize(arguments: nil, error: nil, help: nil); end
  def self.failure(error = nil); end
  def self.help; end
  def self.success(arguments = nil); end
end
module Dry::CLI::Usage
  def self.arguments(command); end
  def self.call(result); end
  def self.command_name(result, name); end
  def self.commands(result); end
  def self.commands_and_arguments(result); end
  def self.description(command); end
  def self.justify(string, padding, usage); end
end
module Dry::CLI::Banner
  def self.arguments(command); end
  def self.call(command, names); end
  def self.command_arguments(command); end
  def self.command_description(command); end
  def self.command_examples(command, name); end
  def self.command_name(name); end
  def self.command_name_and_arguments(command, name); end
  def self.command_options(command); end
  def self.extended_command_arguments(command); end
  def self.extended_command_options(command); end
  def self.full_command_name(names); end
end
module Dry::CLI::Inflector
  def self.dasherize(input); end
end