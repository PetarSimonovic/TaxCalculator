class TaxCalculator

  def initialize(rates)
    @rates = rates 
  end

  def calculate(income)
    total_tax = 0

    # batch the income into the tax bands
    batched_income = batch_income(income)

    # calculate the rate for each band of income
    batched_income.each_with_index do |value, index| 
     rate = @rates[index][:percentage]
     total_tax += calculate_at_rate(value, rate)
    end
    total_tax
  end

  private 

  def calculate_at_rate(amount, rate)
    amount * rate/100
  end

  def batch_income(income)
    current_rate = 0
    batched_income = []
      @rates.each_with_index do |rate, index|
      if index == @rates.length - 1 || income < rate[:income_threshold]
        batched_income.push(income - current_rate)
        return batched_income
      else
          batched_income.push(rate[:income_threshold] - current_rate)
          current_rate = rate[:income_threshold]
      end
    end
  end
end