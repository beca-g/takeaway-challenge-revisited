describe "User Stories" do
  let(:dishes) { { Pizza: 10.00, Carbonara: 15.00, Risotto: 12.00 } }
  let(:menu) { Menu.new(dishes) }
  let(:order) { Order.new }
  let(:takeaway) { Takeaway.new(menu, order) }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "displays a menu of dishes with prices" do
    expect(takeaway.view_menu).to eq "Pizza £10.00, Carbonara £15.00, Risotto £12.00"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "can order a number of dishes" do
    expect(order).to receive(:add).at_most(4).times
    new_order = { Pizza: 2, Carbonara: 1, Risotto: 1 }
    takeaway.place_order(new_order)
  end
end
