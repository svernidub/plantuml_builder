require 'spec_helper'

describe PlantumlBuilder::Compressor do
  let(:uml) do
    <<-WSD.gsub(/(^\s{4})/, '')
      @startuml
        actor User
  
        User -> MyService : perform
        activate MyService
          return true
        deactivate MyService
      @enduml
    WSD
  end

  let(:encoded) do
    'UDfJK70eBaaiAYdDpU5I08B4v9' \
    'By8eNGujGYC1S8G6m5NJi5tyhW' \
    'rAAopEHK1Ik5WjIYjFoYN9YEpB' \
    'B4abI40gZEejIIqg8yXPAYKeX8' \
    'IYfMfGwfUIaWsm5R-2hl'
  end

  describe '#encode' do
    it 'compresses uml' do
      expect(described_class.new(uml).encode).to eq encoded
    end
  end
end