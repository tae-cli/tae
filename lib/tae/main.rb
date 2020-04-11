# typed: true
# frozen_string_literal: true

require 'dry/cli'
require 'sorbet-runtime'

require 'tae/command'
require 'tae/version'

module Tae
  # CLI entry point to tae
  #
  # This class is what is run when tae is invoked at the command line. It kicks
  # off the search any installed gems presumed to be tae plugins and their
  # loading into memory and the dry-cli registry before starting everything.
  #
  # @api public
  class Main
    extend T::Sig

    sig { void }
    # Start tae
    #
    # Boots up tae. This will, in turn
    # - Load any plugins tae is able to discover
    # - Assume that these plugins register all command classes
    # - Start the cli via dry-cli
    #
    # @return [void]
    # @example Statring tae
    #     Tae::Main.start
    def start; end
  end
end
