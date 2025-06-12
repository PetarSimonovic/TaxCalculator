class TaxCalculator

  def initialize(bands)
    @bands = bands 
  end

  def calculate(income)
    return 0 unless income
    calculate_taxes_for_bands(income)
  end

  private 

  def calculate_at_rate(amount, rate)
    amount * rate/100.0
  end

  def calculate_taxes_for_bands(income)
    total_tax = 0
    previous_threshold = 0
    @bands.each_with_index do |band, index|
      current_threshold = band[:income_threshold]
      if finished_band_calculations?(index, income, current_threshold)
        total_tax += calculate_at_rate(income - previous_threshold, band[:rate])
        return total_tax
      else
        amount = current_threshold - previous_threshold
        total_tax += calculate_at_rate(amount, band[:rate])
        previous_threshold = current_threshold
      end
    end
  end

  def finished_band_calculations?(index, income, income_threshold)
      index == @bands.length - 1 || income < income_threshold
  end
end