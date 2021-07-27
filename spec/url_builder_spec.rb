require 'plantuml_builder'

describe PlantumlBuilder::UrlBuilder do
  describe '#build' do
    let(:server) { 'http://localhost:8080' }
    let(:format) { :svg }

    let(:encoded) do
      'UDfJK70eBaaiAYdDpU5I08B4v9' \
      'By8eNGujGYC1S8G6m5NJi5tyhW' \
      'rAAopEHK1Ik5WjIYjFoYN9YEpB' \
      'B4abI40gZEejIIqg8yXPAYKeX8' \
      'IYfMfGwfUIaWsm5R-2hl'
    end

    let(:url) do
      'http://localhost:8080/svg/' \
      '~1' \
      'UDfJK70eBaaiAYdDpU5I08B4v9' \
      'By8eNGujGYC1S8G6m5NJi5tyhW' \
      'rAAopEHK1Ik5WjIYjFoYN9YEpB' \
      'B4abI40gZEejIIqg8yXPAYKeX8' \
      'IYfMfGwfUIaWsm5R-2hl'
    end

    subject do
      described_class.new(server, format, encoded)
    end

    it 'builds url for specified server, format and code' do
      expect(subject.build).to eq url
    end
  end
end
