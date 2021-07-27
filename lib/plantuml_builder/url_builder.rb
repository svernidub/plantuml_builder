module PlantumlBuilder
  class UrlBuilder
    def initialize(server, format, encoded)
      self.server  = server
      self.format  = format
      self.encoded = encoded
    end

    def build
      "#{server}/#{format}/~1#{encoded}"
    end

    private

    attr_accessor :server, :format, :encoded
  end
end
