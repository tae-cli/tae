# frozen_string_literal: true

RSpec.describe Tae::Command do

  describe '.inherited' do
    class self::TestCommand < Tae::Command
      def call(*)
        nil
      end
    end

    context 'when a class directly subclasses Tae::Command' do
      it 'gets added to Tae::Command.subcommands' do
        expect(
          Tae::Command.instance_variable_get('@subcommands')
        ).to(
          include(self.class::TestCommand)
        )
      end
    end
    
    context 'when subclassing a subclass of Tae::Command' do
      class self::TestCommand < Tae::Command; end
      class self::TestSubCommand < self::TestCommand; end
     
      it 'gets added to the parent subcommands' do
        expect(
          self.class::TestCommand.instance_variable_get('@subcommands')
        ).to(
          include(self.class::TestSubCommand)
        )
      end

      it 'is not added to Tae::Command.subcommands' do
        expect(
          Tae::Command.instance_variable_get('@subcommands')
        ).not_to(
          include(self.class::TestSubCommand)
        )
      end
    end
  end
  
  describe 'class methods' do
    let(:before_clbk) { Proc.new {} }
    class self::TestCommand < Tae::Command
      name 'command'
      aliases 'c', 'cmd'
    end
    class self::TestSubCommand < self::TestCommand
      name 'subcommand'
      aliases 's', 'scmd'
      aliases 'sub'
    end

    describe '.name' do 
      it 'sets name on the class' do
        expect(
          self.class::TestCommand.instance_variable_get('@name')
        ).to(
          match('command')
        )
      end
      it 'sets a distinct name from parent class' do
        expect(
          self.class::TestSubCommand.instance_variable_get('@name')
        ).to(
          match('subcommand')
        )
      end
    end

    describe '.aliases' do
      it 'adds multiple aliases for command' do
        expect(
          self.class::TestCommand.instance_variable_get('@aliases')
        ).to(
          include('c', 'cmd')
        )
      end
      it 'does not overwrite old aliases' do
        expect(
          self.class::TestSubCommand.instance_variable_get('@aliases')
        ).to(
          include('s', 'scmd', 'sub')
        )
      end
      it 'sets distinct aliases from parent class' do
        expect(
          self.class::TestSubCommand.instance_variable_get('@aliases')
        ).not_to(
          include('c', 'cmd')
        )
      end
    end

    describe '.before' do
      it 'adds a before callback for command' do
        clbk = Proc.new {}
        
        self.class::TestCommand.before(&clbk)

        expect(
          self.class::TestCommand.instance_variable_get('@before')
        ).to(
          include(clbk)
        )
      end
      
      it 'accepts a bloc' do
        self.class::TestCommand.before {}
      end

      it 'accepts a proc' do
        clbk = Proc.new {}
        
        self.class::TestCommand.before(&clbk)
      end
      
      it 'does not overwrite previous callbacks' do
        clbk_a = Proc.new {}
        clbk_b = Proc.new {}

        self.class::TestCommand.before(&clbk_a)
        self.class::TestCommand.before(&clbk_b)

        expect(
          self.class::TestCommand.instance_variable_get('@before')
        ).to(
          include(clbk_a, clbk_b)
        )
      end
      
      it 'sets distinct callbacks from parent class' do
        clbk_a = Proc.new {}
        clbk_b = Proc.new {}

        self.class::TestCommand.before(&clbk_a)
        self.class::TestSubCommand.before(&clbk_b)

        expect(
          self.class::TestCommand.instance_variable_get('@before')
        ).not_to(
          include(clbk_b)
        )
      end
    end

    describe '.before' do
      it 'adds a before callback for command' do
        clbk = Proc.new {}
        
        self.class::TestCommand.after(&clbk)

        expect(
          self.class::TestCommand.instance_variable_get('@after')
        ).to(
          include(clbk)
        )
      end
      
      it 'accepts a bloc' do
        self.class::TestCommand.after {}
      end

      it 'accepts a proc' do
        clbk = Proc.new {}
        
        self.class::TestCommand.after(&clbk)
      end
      
      it 'does not overwrite previous callbacks' do
        clbk_a = Proc.new {}
        clbk_b = Proc.new {}

        self.class::TestCommand.after(&clbk_a)
        self.class::TestCommand.after(&clbk_b)

        expect(
          self.class::TestCommand.instance_variable_get('@after')
        ).to(
          include(clbk_a, clbk_b)
        )
      end
      
      it 'sets distinct callbacks from parent class' do
        clbk_a = Proc.new {}
        clbk_b = Proc.new {}

        self.class::TestCommand.after(&clbk_a)
        self.class::TestSubCommand.after(&clbk_b)

        expect(
          self.class::TestCommand.instance_variable_get('@after')
        ).not_to(
          include(clbk_b)
        )
      end
    end
  end
end
