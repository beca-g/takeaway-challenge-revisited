require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double :menu, view: view_menu }
  let(:order) { double :order }
  let(:view_menu) { "Pizza: £10.00" }

  describe "#view_menu" do
    it "displays a menu of dishes with prices" do
      expect(takeaway.view_menu).to eq view_menu
    end
  end

  describe "#place_order" do
    it "can order a number of dishes" do
      expect(order).to receive(:add).at_most(4).times
      new_order = { Pizza: 2, Carbonara: 1, Risotto: 1 }
      takeaway.place_order(new_order)
    end
  end
end
