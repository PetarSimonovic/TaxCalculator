class TaxCalculator

  def initialize(rates)
    @rates = rates 
  end

  def calculate(income)
    total_tax = 0
    batched_income = batch_income(income)
    batched_income.each_with_index do |value, index| 
     rate = @rates[index][:percentage]
     total_tax += calculate_at_rate(value, rate)
    end
    total_tax
  end

  private 

  def calculate_at_rate(amount, rate)
    puts(amount, rate)
    amount * rate/100
  end

  def batch_income(income)
    current_rate = 0
    batched_income = []
    income_left_to_tax = income
      @rates.each_with_index do |rate, index|
      if index == @rates.length - 1
        batched_income.push(income - current_rate)
        return batched_income
      elsif income > rate[:income_threshold] 
          income_left_to_tax -= (rate[:income_threshold] - current_rate)
          batched_income.push(rate[:income_threshold] - current_rate)
          current_rate = rate[:income_threshold]
      else
        batched_income.push(income - current_rate)
        return batched_income
      end
    end
  end
end