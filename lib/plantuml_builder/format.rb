module PlantumlBuilder
  class Format
    DEFAULT_HOST = 'http://www.plantuml.com/plantuml'.freeze

    def initialize(diagram, host=DEFAULT_HOST)
      self.host = host
      self.diagram = diagram
    end

    def load
      compress_diagram
      build_url
      fetch_diagram

      data
    end

    protected

    def format
      raise NotImplementedError, '#format should be overloaded'
    end

    private

    def compress_diagram
      self.data = PlantumlBuilder::Compressor.new(diagram).encode
    end

    def build_url
      self.data = PlantumlBuilder::UrlBuilder.new(host, format, data).build
    end

    def fetch_diagram
      self.data = PlantumlBuilder::DiagramFetcher.new(data).fetch
    end

    attr_accessor :host, :diagram, :data
  end
end