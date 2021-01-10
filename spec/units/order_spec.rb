require "order"

describe Order do
  subject(:order) { described_class.new }
  let(:dishes) do 
    {
      Pizza: 2,
      Carbonara: 1,
      Risotto: 1
    }
  end

  describe "#add" do
    it "selects a number of dishes from the menu" do
      order.add(:Pizza, 2)
      order.add(:Carbonara, 1)
      order.add(:Risotto, 1)
      expect(order.dishes).to eq dishes
    end
  end
end
