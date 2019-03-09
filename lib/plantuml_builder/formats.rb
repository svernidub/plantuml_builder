module PlantumlBuilder
  module Formats
    class SVG < PlantumlBuilder::Format
      def load
        super
        make_diagram_versionable
        data
      end

      protected

      def format
        'svg'
      end

      def make_diagram_versionable
        self.data = data.split('>').join(">\n").gsub(/<!--.*-->/m, '')
      end
    end

    class PNG < PlantumlBuilder::Format
      protected

      def format
        'png'
      end
    end

    class TXT < PlantumlBuilder::Format
      protected

      def format
        'txt'
      end
    end
  end
end