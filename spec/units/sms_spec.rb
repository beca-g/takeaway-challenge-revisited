require "sms"

describe Sms do
  subject(:sms) { described_class.new(client) }
  let(:client) { double :client, messages: messages }
  let(:messages) { spy :messages }
  
  describe "#send_sms" do
    it "sends a SMS when the order has been placed" do
      sms.send_sms
      expect(messages).to have_received(:create)
    end
  end
end
