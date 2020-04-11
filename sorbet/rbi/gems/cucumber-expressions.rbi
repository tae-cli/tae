# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/cucumber-expressions/all/cucumber-expressions.rbi
#
# cucumber-expressions-6.0.1

module Cucumber
end
module Cucumber::CucumberExpressions
end
class Cucumber::CucumberExpressions::CucumberExpressionError < StandardError
end
class Cucumber::CucumberExpressions::UndefinedParameterTypeError < Cucumber::CucumberExpressions::CucumberExpressionError
  def initialize(type_name); end
end
class Cucumber::CucumberExpressions::AmbiguousParameterTypeError < Cucumber::CucumberExpressions::CucumberExpressionError
  def expressions(generated_expressions); end
  def initialize(parameter_type_regexp, expression_regexp, parameter_types, generated_expressions); end
  def parameter_type_names(parameter_types); end
end
class Cucumber::CucumberExpressions::ParameterType
  def <=>(other); end
  def initialize(name, regexp, type, transformer, use_for_snippets, prefer_for_regexp_match); end
  def name; end
  def prefer_for_regexp_match?; end
  def regexp_source(regexp); end
  def regexps; end
  def self.check_parameter_type_name(type_name); end
  def string_array(regexps); end
  def transform(self_obj, group_values); end
  def type; end
  def use_for_snippets?; end
end
class Cucumber::CucumberExpressions::ParameterTypeMatcher
  def <=>(other); end
  def advance_to(new_match_position); end
  def find; end
  def group; end
  def initialize(parameter_type, regexp, text, match_position = nil); end
  def parameter_type; end
  def start; end
end
class Cucumber::CucumberExpressions::GeneratedExpression
  def get_parameter_name(type_name, usage_by_type_name); end
  def initialize(expression_template, parameters_types); end
  def parameter_names; end
  def parameter_types; end
  def source; end
end
class Cucumber::CucumberExpressions::CombinatorialGeneratedExpressionFactory
  def generate_expressions; end
  def generate_permutations(generated_expressions, depth, current_parameter_types); end
  def initialize(expression_template, parameter_type_combinations); end
end
class Cucumber::CucumberExpressions::CucumberExpressionGenerator
  def create_parameter_type_matchers(text); end
  def create_parameter_type_matchers2(parameter_type, text); end
  def escape(s); end
  def generate_expression(text); end
  def generate_expressions(text); end
  def initialize(parameter_type_registry); end
end
class Cucumber::CucumberExpressions::ParameterTypeRegistry
  def define_parameter_type(parameter_type); end
  def initialize; end
  def lookup_by_regexp(parameter_type_regexp, expression_regexp, text); end
  def lookup_by_type_name(name); end
  def parameter_types; end
end
class Cucumber::CucumberExpressions::Group
  def children; end
  def end; end
  def initialize(value, start, _end, children); end
  def start; end
  def value; end
  def values; end
end
class Cucumber::CucumberExpressions::Argument
  def group; end
  def initialize(group, parameter_type); end
  def self.build(tree_regexp, text, parameter_types); end
  def value(self_obj = nil); end
end
class Cucumber::CucumberExpressions::GroupBuilder
  def add(group_builder); end
  def build(match, group_indices); end
  def capturing?; end
  def children; end
  def initialize; end
  def move_children_to(group_builder); end
  def set_non_capturing!; end
  def source; end
  def source=(arg0); end
end
class Cucumber::CucumberExpressions::TreeRegexp
  def group_builder; end
  def initialize(regexp); end
  def match(s); end
  def regexp; end
end
class Cucumber::CucumberExpressions::CucumberExpression
  def build_capture_regexp(regexps); end
  def check_no_parameter_type(s, message); end
  def initialize(expression, parameter_type_registry); end
  def match(text); end
  def process_alternation(expression); end
  def process_escapes(expression); end
  def process_optional(expression); end
  def process_parameters(expression, parameter_type_registry); end
  def regexp; end
  def source; end
  def to_s; end
end
class Cucumber::CucumberExpressions::RegularExpression
  def initialize(expression_regexp, parameter_type_registry); end
  def match(text); end
  def regexp; end
  def source; end
  def to_s; end
end
