describe "User Stories" do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "displays a menu of dishes with prices" do
    dishes = {Pizza: 10.00, Carbonara: 15.00, Risotto: 12.00}
    menu = Menu.new(dishes)
    takeaway = Takeaway.new(menu)
    expect(takeaway.view_menu).to eq "Pizza £10.00, Carbonara £15.00, Risotto £12.00"
  end
end