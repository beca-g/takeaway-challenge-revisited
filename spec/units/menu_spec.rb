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
end
