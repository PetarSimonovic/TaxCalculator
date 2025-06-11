class TaxCalculator

  def initialize(rates)
    @rates = rates 
  end

  def calculate(amount)
    puts("RATE!")
    rate = @rates[0]
    calculate_at_rate(amount, rate[:percentage])
  end

  private 

  def calculate_at_rate(amount, rate)
    puts(amount, rate)
    amount * rate/100
  end
end