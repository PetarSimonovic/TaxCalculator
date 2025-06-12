require 'tax_calculator'

bands = [
  { income_threshold: 15600, rate: 10.5 },
  { income_threshold: 53500, rate: 17.5 },
  { income_threshold: 78100, rate: 30 },
  { income_threshold: 180000, rate: 33 },
  { income_threshold: Float::INFINITY, rate: 39 }
]
RSpec.describe TaxCalculator do

   it 'calculates tax correctly for $0' do
    tax_calculator = TaxCalculator.new(bands)
    expect(tax_calculator.calculate(0)).to eq(0)
  end
  it 'calculates tax correctly for $10,000' do
    tax_calculator = TaxCalculator.new(bands)
    expect(tax_calculator.calculate(10000)).to eq(1050.00)
  end

  it 'calculates tax correctly for $35,000' do
    tax_calculator = TaxCalculator.new(bands)
    expect(tax_calculator.calculate(35000)).to eq(5033.00)
  end

  it 'calculates tax correctly for $100,000' do
    tax_calculator = TaxCalculator.new(bands)
    expect(tax_calculator.calculate(100000)).to eq(22877.50)
  end


  it 'calculates tax correctly for $220,000' do
    tax_calculator = TaxCalculator.new(bands)
    expect(tax_calculator.calculate(220000)).to eq(64877.50)
  end

end