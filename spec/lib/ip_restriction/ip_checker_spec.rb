describe IpRestriction::IpChecker do
  let(:allowed_ips) { ['127.0.0.1'] }

  describe '#allowed?' do
    subject(:allowed) { described_class.new(allowed_ips).allowed?(ip) }

    context 'when IP is NOT allowed' do
      let(:ip) { '2.2.2.2' }

      it { is_expected.to be false }
    end

    context 'when IP is allowed' do
      let(:ip) { '127.0.0.1' }

      it { is_expected.to be true }
    end
  end
end
