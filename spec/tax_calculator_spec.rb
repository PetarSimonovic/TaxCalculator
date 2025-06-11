require 'tax_calculator'

RSpec.describe TaxCalculator do
  it 'calculates tax correctly' do
    calc = TaxCalculator.new
    expect(calc.calculate(100, 0.2)).to eq(20)
  end
end