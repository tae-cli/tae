# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'
require 'thor'

require 'tae/version'

module Tae
  # CLI entry point to tae
  #
  # This class is what is run when tae is invoked at the command line. It kicks
  # off the search any installed gems presumed to be tae plugins and their
  # loading into memory.
  #
  # @api public
  class Main < Thor
    extend T::Sig

    sig { void }
    desc 'version', 'Print the version of the current installation'
    # Print the version
    #
    # This prints the version of the currently installed tae
    #
    # @return [void]
    # @example On your shell
    #     tae version
    def version
      puts Tae::VERSION
    end
  end
end
