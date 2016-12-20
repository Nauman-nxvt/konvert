module Konvert
  module Operations

    def perform_sum(operand1,operand2,operation)
      amount1 = operand1.convert_to_base_amount
      amount2 = operand2.convert_to_base_amount
      sum_in_base_currency = send(operation, amount1, amount2)
      result = Money.new(sum_in_base_currency, Money.base_currency)
      operand1.currency == Money.base_currency ? result : result.convert_to(operand1.currency)
    end

    def add(val1,val2)
      val1 + val2
    end

    def subtract(val1,val2)
      val1 - val2
    end

    def +(operand)
      perform_sum(self,operand,'add')
    end

    def -(operand)
      perform_sum(self,operand,'subtract')
    end

    def *(operand)
      Money.new(self.amount * operand, self.currency)
    end

    def /(operand)
      Money.new(self.amount / operand, self.currency)
    end

    # Comparisons

    def ==(operand)
      return self.convert_to_base_amount == operand.convert_to_base_amount
    end

    def >(operand)
      return self.convert_to_base_amount > operand.convert_to_base_amount
    end

    def <(operand)
      return self.convert_to_base_amount < operand.convert_to_base_amount
    end
  end
end