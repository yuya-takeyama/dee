module Dee
  class Container
    class Factory
      def initialize(&block)
        @block = block
      end

      def call(*args)
        @block.call(*args)
      end
    end

    class SingletonFactory < Factory
      def initialize(&block)
        @block = block
        @value = nil
      end

      def call
        @value = @block.call unless @value
        @value
      end
    end

    def initialize
      @values = Hash.new
    end

    def factory(key, &block)
      @values[key] = Factory.new(&block)
    end

    def singleton(key, &block)
      @values[key] = SingletonFactory.new(&block)
    end

    def [](key)
      raise "'%s' is not defined in container" unless @values.key? key

      value = @values[key]

      if value.kind_of? Factory
        value.call
      end
    end

    def create(key, args)
      raise "'%s' is not defined in container" unless @values.key? key

      @values[key].call(*args)
    end
  end
end
