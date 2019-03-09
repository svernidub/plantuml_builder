require 'spec_helper'

describe PlantumlBuilder::DiagramFetcher do
  describe '#fetch' do
    let(:url) do
      'http://localhost:8080/svg/' \
      'UDfJK70eBaaiAYdDpU5I08B4v9' \
      'By8eNGujGYC1S8G6m5NJi5tyhW' \
      'rAAopEHK1Ik5WjIYjFoYN9YEpB' \
      'B4abI40gZEejIIqg8yXPAYKeX8' \
      'IYfMfGwfUIaWsm5R-2hl'
    end

    subject do
      described_class.new(url)
    end

    it 'performs request to server' do
      VCR.use_cassette('diagram_fetcher/svg_file') do
        expect(subject.fetch).not_to be_empty
      end
    end
  end
end