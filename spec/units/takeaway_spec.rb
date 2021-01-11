require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double :menu, view: view_menu }
  let(:order) { double :order, total: 47.00 }
  let(:view_menu) { "Pizza: £10.00" }

  describe "#view_menu" do
    it "displays a menu of dishes with prices" do
      expect(takeaway.view_menu).to eq view_menu
    end
  end

  describe "#place_order" do
    new_order = { Pizza: 2, Carbonara: 1, Risotto: 1 }

    it "can order a number of dishes" do
      expect(order).to receive(:add).at_most(3).times
      takeaway.place_order(new_order)
    end

    it "checks the total of the order" do
      allow(order).to receive(:add)
      total = takeaway.place_order(new_order)
      expect(total).to eq 47.00
    end
  end
end
