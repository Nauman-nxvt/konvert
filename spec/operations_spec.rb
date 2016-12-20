require_relative '../lib/operations'
require_relative '../lib/money'

module Konvert
  describe 'Operations' do
    before(:all) do
      Money.conversion_rates('EUR', {
          'USD'     => 1.11,
          'Bitcoin' => 0.0047
      })
      @twenty_dollars = Money.new(20, 'USD')
      @fifty_euro = Money.new(50,'EUR')
    end
    describe 'perform_sum' do
      it 'allows to add two money objects' do
        sum = @fifty_euro + @twenty_dollars
        expect(sum.amount.round(2)).to eq(68.02)
        expect(sum.currency).to eq('EUR')
      end
      it 'allows to subtract two money objects' do
        difference = @fifty_euro - @twenty_dollars
        expect(difference.amount.round(2)).to eq(31.98)
        expect(difference.currency).to eq('EUR')
      end
    end

    describe '*' do
      it 'allows to multiply a money object with an integer' do
        result = @twenty_dollars * 3
        expect(result.amount.round(2)).to eq(60.00)
        expect(result.currency).to eq('USD')
      end
    end

    describe '/' do
      it 'allows to divide a money object by an integer' do
        result = @fifty_euro / 2
        expect(result.amount.round(2)).to eq(25.00)
        expect(result.currency).to eq('EUR')
      end
    end

    describe '==' do
      it 'allows to compare equality of 2 money objects' do
        expect(@twenty_dollars == Money.new(20, 'USD')).to be true
        expect(@twenty_dollars == Money.new(30, 'USD')).to be false
      end
    end

    describe '>' do
      it 'allows to compare if one money object is greater than the other money object' do
        expect(@twenty_dollars > Money.new(5, 'USD') ).to be true
      end
    end

    describe '<' do
      it 'allows to compare if one money object is less than the other money object' do
        expect(@twenty_dollars < @fifty_euro ).to be true
      end
    end

  end
end