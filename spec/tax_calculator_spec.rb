require 'tax_calculator'

rates = [
  { income_threshold: 15600, percentage: 10.5 },
  { income_threshold: 53500, percentage: 17.5 },
  { income_threshold: 78100, percentage: 30 },
  { income_threshold: 18000, percentage: 33 },
  { income_threshold: 15600, percentage: 39 }
]
RSpec.describe TaxCalculator do
  it 'calculates tax correctly for the lowest rate' do
    tax_calculator = TaxCalculator.new(rates)
    expect(tax_calculator.calculate(10000)).to eq(1050.00)
  end

end