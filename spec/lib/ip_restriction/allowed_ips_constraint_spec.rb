describe IpRestriction::AllowedIpsConstraint do
  before do
    allow_any_instance_of(IpRestriction::IpLoader).to receive(:load)
      .and_return([])
  end

  describe '#matches?' do
    let(:request) { double(remote_ip: 'any') }

    context 'when IP allowed' do
      before do
        allow_any_instance_of(IpRestriction::IpChecker)
          .to receive(:allowed?) { true }
      end

      it 'returns true' do
        expect(subject.matches?(request)).to eq true
      end
    end

    context 'when IP not allowed' do
      before do
        allow_any_instance_of(IpRestriction::IpChecker)
          .to receive(:allowed?) { false }
      end

      it 'returns false' do
        expect(subject.matches?(request)).to eq false
      end
    end
  end
end
