# typed: strict
# frozen_string_literal: true

require 'dry/cli'
require 'sorbet-runtime'

module Tae
  # Base class for auto-registering commands to tae
  #
  # Need the real usage docs here zomg
  #
  # @api public
  class Command < Dry::CLI::Command
    extend T::Sig
    extend T::Helpers

    sig { params(child: T.class_of(Tae::Command)).void }
    # Auto-register child commands
    #
    # @return [void]
    # @api private
    def self.inherited(child)
      super
      send :add_subcommand, child
    end

    @name = T.let(
      nil,
      T.nilable(String)
    )

    @aliases = T.let(
      Set.new,
      T.nilable(T::Set[String])
    )

    @subcommands = T.let(
      Set.new,
      T.nilable(
        T::Set[
          T.class_of(Tae::Command)
        ]
      )
    )

    @before = T.let(
      Set.new,
      T.nilable(
        T::Set[
          T.proc.params(
            a: T.nilable(T::Hash[Symbol, String])
          ).void
        ]
      )
    )

    @after = T.let(
      Set.new,
      T.nilable(
        T::Set[
          T.proc.params(
            a: T.nilable(T::Hash[Symbol, String])
          ).void
        ]
      )
    )

    class << self
      extend T::Sig

      sig { params(name: String).void }
      # Set the name of this command
      #
      # @param name [String]
      # @return [void]
      # @example Setting the name for a command
      #     def MyCmd < Tae::Command
      #       name 'my-cmd'
      #     end
      def name(name) # rubocop:disable Style/TrivialAccessors
        @name = name
      end

      sig do
        params(
          ali: String,
          aliases: String
        ).void
      end
      # Set the list of aliases for this command
      #
      # @param aliases [Enumerable<String>]
      # @return [void]
      # @example Setting the aliases for a command
      #     def MyCmd < Tae::Command
      #       name 'my-cmd'
      #       aliases 'mc', 'c'
      #     end
      def aliases(ali, *aliases)
        @aliases ||= Set.new
        @aliases.add(ali)
        aliases&.each { |a| @aliases.add(a) }
      end

      sig do
        params(
          blk: T.proc.params(
            a: T.nilable(T::Hash[Symbol, String])
          ).void
        ).void
      end
      # Add a callback to run before this command
      #
      # Adds this callback to the list of callbacks that are called
      # and passed the command line parameters before the command
      # runs. The order they are called in is not guarenteed
      #
      # @yield [a] the callback to run before this command
      # @yieldparam [optional, Hash<Symbol, String>] the arguments passed to
      #   the command
      # @yieldreturn [void]
      # @return [void]
      # @example Setting a before hook for a command
      #     def MyCmd < Tae::Command
      #       name 'my-cmd'
      #       before do |args|
      #         puts args
      #       end
      #     end
      def before(&blk)
        @before ||= Set.new
        @before.add(blk)
      end

      sig do
        params(
          blk: T.proc.params(
            a: T.nilable(T::Hash[Symbol, String])
          ).void
        ).void
      end
      # Add a callback to run after this command
      #
      # Adds this callback to the list of callbacks that are called
      # and passed the command line parameters after the command
      # runs. The order they are called in is not guarenteed
      #
      # @yield [a] the callback to run before this command
      # @yieldparam [optional, Hash<Symbol, String>] the arguments passed to
      #   the command
      # @yieldreturn [void]
      # @return [void]
      # @example Setting the aliases for a command
      #     def MyCmd < Tae::Command
      #       name 'my-cmd'
      #       after do |args|
      #         puts args
      #       end
      #     end
      def after(&blk)
        @after ||= Set.new
        @after.add(blk)
      end

      private

      sig { params(subcommand: T.class_of(Tae::Command)).void }
      # Adds a subcommand to this command
      #
      # @param subcommand [Tae::Command] the command to add
      # @return [void]
      # @api private
      def add_subcommand(subcommand)
        @subcommands ||= Set.new
        @subcommands.add(subcommand)
      end
    end
  end
end
