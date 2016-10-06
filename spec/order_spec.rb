require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu")}
  let(:dishes) { {chicken: 2, chips: 1} }

  it 'selects several dishes from the menu' do
    order.add(:chicken, 2)
    order.add(:chips, 1)
    expect(order.dishes).to eq(dishes)
  end
end
