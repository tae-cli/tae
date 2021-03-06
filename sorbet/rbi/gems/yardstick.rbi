# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/yardstick/all/yardstick.rbi
#
# yardstick-0.9.9

module Yardstick
  def self.measure(config = nil); end
  def self.measure_string(string, config = nil); end
  def self.round_percentage(percentage); end
end
class Yardstick::OrderedSet
  def <<(entry); end
  def each(&block); end
  def empty?; end
  def include?(entry); end
  def index(entry); end
  def initialize(entries = nil); end
  def length; end
  def merge(other); end
  include Enumerable
end
class Yardstick::Measurement
  def description; end
  def initialize(rule); end
  def measure; end
  def ok?; end
  def puts(io = nil); end
  def skip?; end
end
class Yardstick::Config
  def defaults=(options); end
  def for_rule(rule_class); end
  def initialize(options = nil, &block); end
  def output; end
  def output=(output); end
  def path; end
  def path=(arg0); end
  def require_exact_threshold=(arg0); end
  def require_exact_threshold?; end
  def self.coerce(hash, &block); end
  def self.normalize_hash(hash); end
  def threshold; end
  def threshold=(arg0); end
  def verbose=(arg0); end
  def verbose?; end
end
class Yardstick::Config::InvalidRule < StandardError
end
class Yardstick::ReportOutput
  def initialize(target); end
  def self.coerce(target); end
  def to_s; end
  def write(&block); end
end
class Yardstick::Document
  def api?(types); end
  def docstring; end
  def file; end
  def has_tag?(name); end
  def initialize(docstring); end
  def line; end
  def object; end
  def path; end
  def self.measure(document, config); end
  def self.register_rule(rule_class); end
  def self.registered_rules; end
  def summary_text; end
  def tag(name); end
  def tag_text(tag_name); end
  def tag_types(tag_name); end
  def visibility; end
end
class Yardstick::Document::NullTag
  def text; end
  def types; end
end
class Yardstick::Rule
  def api?(*args, &block); end
  def document; end
  def enabled?; end
  def has_tag?(*args, &block); end
  def initialize(document, config = nil); end
  def self.coerce(document, config); end
  def self.description; end
  def self.description=(arg0); end
  def self.inherited(subclass); end
  def summary_text(*args, &block); end
  def tag_text(*args, &block); end
  def tag_types(*args, &block); end
  def validatable?; end
  def visibility(*args, &block); end
  extend Forwardable
end
class Yardstick::RuleConfig
  def enabled_for_path?(path); end
  def exclude?(path); end
  def initialize(options = nil); end
end
module Yardstick::Rules
end
class Yardstick::Rules::ApiTag
end
class Yardstick::Rules::ApiTag::Presence < Yardstick::Rule
  def valid?; end
end
class Yardstick::Rules::ApiTag::Inclusion < Yardstick::Rule
  def valid?; end
end
class Yardstick::Rules::ApiTag::ProtectedMethod < Yardstick::Rule
  def valid?; end
  def validatable?; end
end
class Yardstick::Rules::ApiTag::PrivateMethod < Yardstick::Rule
  def valid?; end
  def validatable?; end
end
class Yardstick::Rules::ExampleTag < Yardstick::Rule
  def valid?; end
  def validatable?; end
end
class Yardstick::Rules::Summary
end
class Yardstick::Rules::Summary::Presence < Yardstick::Rule
  def valid?; end
  def validatable?; end
end
class Yardstick::Rules::Summary::Length < Yardstick::Rule
  def valid?; end
end
class Yardstick::Rules::Summary::Delimiter < Yardstick::Rule
  def valid?; end
end
class Yardstick::Rules::Summary::SingleLine < Yardstick::Rule
  def valid?; end
end
class Yardstick::Rules::ReturnTag < Yardstick::Rule
  def valid?; end
end
class Yardstick::MeasurementSet < Yardstick::OrderedSet
  def coverage; end
  def coverage_text; end
  def failed; end
  def failed_text; end
  def puts(io = nil); end
  def puts_summary(io); end
  def successful; end
  def successful_text; end
  def total; end
  def total_text; end
end
class Yardstick::DocumentSet < Yardstick::OrderedSet
  def measure(config); end
end
class Yardstick::Processor
  def initialize(config); end
  def paths; end
  def process; end
  def process_string(string); end
end
class Yardstick::Parser
  def self.documents; end
  def self.method_objects; end
  def self.parse_paths(paths); end
  def self.parse_string(string); end
end
module YARD
end
