require 'ip_restriction/middleware'

describe IpRestriction::Middleware do
  describe '#call' do
    let(:app) { double(:app) }
    let(:env) { { "REMOTE_ADDR" => "10.10.10.10" } }

    subject { described_class.new(app) }

    before do
      allow_any_instance_of(IpRestriction::IpChecker).to receive(:allowed?).with("10.10.10.10").and_return(allowed)
    end

    context 'when remote ip is allowed' do
      let(:allowed) { true }

      it 'calls next middleware' do
        expect(app).to receive(:call).with(env)

        subject.call(env)
      end
    end

    context 'when remote ip isnt allowed' do
      let(:allowed) { false }

      it 'does not call next middleware' do
        expect(app).to_not receive(:call).with(env)

        subject.call(env)
      end

      it 'returns 404' do
        expect(subject.call(env)).to eql([404, {}, ['']])
      end
    end
  end
end
