describe IpRestriction::IpLoader do
  let(:file_path) { File.expand_path('../../../fixtures/ips.yml', __FILE__) }

  describe '#load' do
    context 'when yaml file exists' do
      subject { described_class.new(file_path) }

      it 'returns a list of ips' do
        expect(subject.load).to eq ['10.10.10.10', '20.20.20.20']
      end
    end

    context 'when yaml file does not exist' do
      subject { described_class.new('/tmp/anyfile.txt') }

      it 'returns an empty array' do
        expect(subject).to receive(:warn)
        expect(subject.load).to eq IpRestriction::IpLoader::DEFAULT_IPS
      end
    end
  end
end
