module PlantumlBuilder
  class Compressor
    def initialize(uml)
      self.uml = uml
    end

    def encode
      value = uml

      [PlantumlBuilder::Deflate, PlantumlBuilder::Encode64].each do |encoder|
        value = encoder.new(value).encode
      end

      value
    end

    private

    attr_accessor :uml
  end
end
