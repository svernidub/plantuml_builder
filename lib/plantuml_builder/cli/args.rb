module PlantumlBuilder
  module Cli
    class Args
      def initialize(args_hash)
        self.args_hash = args_hash
      end

      def svg?
        args_hash['svg']
      end

      def png?
        args_hash['png']
      end

      def txt?
        args_hash['txt']
      end

      def source
        args_hash['<source>']
      end

      def destination
        args_hash['<destination>']
      end

      def recursive?
        args_hash['-R']
      end

      def source_dir
        args_hash["<source_dir>"]
      end

      def destination_dir
        args_hash["<destination_dir>"]
      end

      def version?
        args_hash['--version']
      end

      def endpoint
        args_hash['<endpoint>']
      end

      private

      attr_accessor :args_hash
    end
  end
end
