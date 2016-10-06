require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { {chicken: 3.50, hotdog: 1.50, chips: 2.00} }

  it 'has a list of dishes with prices' do
    expect(menu.dishes).to eq(dishes)
  end

  it 'calculates a price' do
    expect(menu.price(:chicken)).to eq(dishes[:chicken])
  end

end
