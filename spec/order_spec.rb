require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double (:menu) }
  let(:dishes) { {chicken: 2, chips: 1} }

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:chips).and_return(true)
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)

    allow(menu).to receive(:price).with(:chicken).and_return(3.50)
    allow(menu).to receive(:price).with(:chips).and_return(2.00)
  end

  it 'selects several dishes from the menu' do
    order.add(:chicken, 2)
    order.add(:chips, 1)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow customers to order dishes that are not on the menu' do
    expect{ order.add(:beef, 2) }.to raise_error('Beef is not on the menu')
  end

  it 'calculates the total of the order' do
    order.add(:chicken, 2)
    order.add(:chips, 1)
    total = 9.00
    expect(order.total).to eq(total)
  end

end
