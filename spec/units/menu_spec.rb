require "menu"

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do 
    { 
      Pizza: 10.00,
      Carbonara: 15.00,
      Risotto: 12.00
    }
  end

  describe "#dishes" do
    it "has a list of dishes" do
      expect(menu.dishes).to eq dishes
    end
  end

  describe "#view" do
    it "displays a menu of dishes with prices" do
      printed_menu = "Pizza £10.00, Carbonara £15.00, Risotto £12.00" 
      expect(menu.view).to eq printed_menu
    end
  end

  describe "#has_dish?" do
    it "checks if a dish is not on the menu" do
      expect(menu.has_dish?(:Pasta)).to be false
    end

    it "checks if a dish is on the menu" do
      expect(menu.has_dish?(:Pizza)).to be true
    end
  end

  describe "#price" do
    it "checks the price of a dish" do
      expect(menu.price(:Pizza)).to eq dishes[:Pizza]
    end
  end
end
