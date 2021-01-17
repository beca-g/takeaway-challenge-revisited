require "sms"

describe Sms do
  subject(:sms) { described_class.new(client) }
  let(:client) { double :client, messages: messages }
  let(:messages) { spy :messages }

  let(:message) do
    { 
    body: "Thank you! Your order was placed and will be delivered no later than 18:52.",
    from: nil,
    to: nil } 
  end
  
  describe "#send_sms" do
    it "sends a SMS with an estimated delivery when the order has been placed" do
      allow(Time).to receive(:now).and_return(Time.parse("17:52"))
      sms.send_sms
      expect(messages).to have_received(:create).with(message)
    end
  end
end
