require 'net/http'

module PlantumlBuilder
  class DiagramFetcher
    def initialize(url)
      self.uri = URI(url)
    end

    def fetch
      Net::HTTP.get(uri)
    end

    private

    attr_accessor :uri
  end
end