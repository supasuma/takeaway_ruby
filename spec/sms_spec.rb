require 'sms'

describe SMS do
  subject(:sms) { described_class.new(client: client) }
  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }
  let(:config) do
    {
      from: '+441823240177',
      to: '+447501496200',
      body: "Thank you! Your order was placed and will be delivered by %s",
      account_sid: 123,
      auth_token: "23fds"
    }
  end

  it 'delivers an SMS with an estimated time' do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you! Your order was placed and will be delivered by 18:52"
    }

    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
    sms.deliver
    expect(messages).to have_received(:create).with(args)
  end
end
