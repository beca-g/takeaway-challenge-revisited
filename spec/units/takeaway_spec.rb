require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order, sms) }
  let(:menu) { double :menu, view: view_menu }
  let(:order) { double :order, total: 47.00 }
  let(:sms) { double :sms }
  let(:view_menu) { "Pizza: £10.00" }

  describe "#view_menu" do
    it "displays a menu of dishes with prices" do
      expect(takeaway.view_menu).to eq view_menu
    end
  end

  describe "#place_order" do
    before do
      allow(menu).to receive(:has_dish?).and_return true

      allow(menu).to receive(:price).with(:Pizza).and_return(10.00)
      allow(menu).to receive(:price).with(:Carbonara).and_return(15.00)
      allow(menu).to receive(:price).with(:Risotto).and_return(12.00)

      allow(order).to receive(:add)
      allow(sms).to receive(:send_sms)
    end

    new_order = { Pizza: 2, Carbonara: 1, Risotto: 1 }

    it "can order a number of dishes" do
      expect(order).to receive(:add).at_most(3).times
      takeaway.place_order(new_order)
    end

    it "checks the total of the order" do
      total = takeaway.place_order(new_order)
      expect(total).to eq 47.00
    end

    it "sends a message once the order has been placed" do
      takeaway.place_order(new_order)
    end
  end
end
