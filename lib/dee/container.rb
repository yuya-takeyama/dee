module Dee
  class Container
    class Factory
      def initialize(&block)
        @block = block
      end

      def create
        @block.call
      end
    end

    class SingletonFactory < Factory
      def initialize(&block)
        @block = block
        @value = nil
      end

      def create
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
        value.create
      else
        value
      end
    end

    def []=(key, value)
      @values[key] = value
    end
  end
end
