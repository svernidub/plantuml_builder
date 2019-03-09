module PlantumlBuilder
  class Encode64
    # Encoding alphabet
    # 0..9,
    # A..Z,
    # a..z,
    # -,
    # _
    ALPHABET = ['0'..'9',
                'A'..'Z',
                'a'..'z',
                %w[- _ ?]].map(&:to_a).flatten.freeze

    def initialize(string)
      self.diagram = string
      self.query   = ''
    end

    def encode
      align_diagram.map(&:ord).each_slice(3) do |slice|
        append3bytes(*slice)
      end

      query
    end

    private

    attr_accessor :diagram, :query

    def align_diagram
      chars = diagram.chars
      unaligned = chars.length % 3
      left = unaligned.zero? ? 0 : 3 - unaligned

      chars + [0] * left
    end

    def append3bytes(b1, b2, b3)
      c1 = b1 >> 2
      c2 = ((b1 & 0x3) << 4) | (b2 >> 4)
      c3 = ((b2 & 0xF) << 2) | (b3 >> 6)
      c4 = b3 & 0x3F

      [c1, c2, c3, c4].each do |c|
        self.query += encode6bit(c & 0x3F)
      end
    end

    def encode6bit(b)
      ALPHABET[b] || ALPHABET.last
    end
  end
end