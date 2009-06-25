
require 'hitimes'

module Hitimes

  class GroupMetric 

    class << self
      attr_reader :timers

      def measure(name, additional_data = {}, &block)
        @timers ||= {}
        @timers[name] ||= TimedMetric.new(name, additional_data)
        @timers[name].measure(&block)
      end

      def [](name)
        @timers[name]
      end

      def measurements
        @timers.values
      end

      def reset!
        @timers = {}
      end
    end
  end
end

        

