describe IpRestriction do
  describe '.configure' do
    after do
      described_class.configure do |config|
        config.file_path = nil
      end
    end

    it 'sets the file_path' do
      described_class.configure do |config|
        config.file_path = '/path'
      end

      expect(described_class.file_path).to eq '/path'
    end
  end

  describe 'configuration default values' do
    it 'gets the default file_path' do
      expect(described_class.file_path).to eq "config/ip_restriction.yml"
    end
  end
end
