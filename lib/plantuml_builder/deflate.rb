require 'zlib'
module PlantumlBuilder
  class Deflate
    LEVEL = Zlib::BEST_COMPRESSION

    def initialize(diagram)
      self.diagram = diagram
    end

    def encode
      Zlib::Deflate.deflate(diagram.encode('UTF-8'), LEVEL)
    end

    private

    attr_accessor :diagram
  end
end
