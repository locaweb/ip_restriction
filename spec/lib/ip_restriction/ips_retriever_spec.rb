describe IpRestriction::IpsRetriever do
  describe '#office_ips' do
    let(:file_path) { File.expand_path('../../../fixtures/ips.yml', __FILE__) }

    before do
      IpRestriction.configure do |config|
        config.file_path = file_path
      end
    end

    after do
      IpRestriction.configure do |config|
        config.file_path = nil
      end
    end

    it 'returns office ips' do
      expect(subject.office_ips).to eq ['10.10.10.10', '20.20.20.20']
    end
  end
end
