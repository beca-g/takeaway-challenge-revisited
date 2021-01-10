require "order"

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:dishes) do 
    {
      Pizza: 2,
      Carbonara: 1,
      Risotto: 1
    }
  end

  describe "#add" do
    context "items are included on the menu" do
      before do
        allow(menu).to receive(:has_dish?).with(:Pizza).and_return true
        allow(menu).to receive(:has_dish?).with(:Carbonara).and_return true
        allow(menu).to receive(:has_dish?).with(:Risotto).and_return true
      end

      it "selects a number of dishes from the menu" do
        order.add(:Pizza, 2)
        order.add(:Carbonara, 1)
        order.add(:Risotto, 1)
        expect(order.dishes).to eq dishes
      end
    end
  end

  context "items not on the menu" do
    it "doesn't allow items to be added" do
      allow(menu).to receive(:has_dish?).with(:Cake).and_return false
      expect { order.add(:Cake, 1) }.to raise_error "Cake not on the menu please try again"
    end
  end
end
