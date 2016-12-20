require_relative '../lib/money'

module Konvert
  describe "Money" do

    before(:all) do
      Money.conversion_rates('EUR', {
          'USD'     => 1.11,
          'Bitcoin' => 0.0047
      })
    end

    describe 'attributes' do
      before(:example) do
        @money = Money.new(50, 'EUR')
      end
      it 'allows reading and writing for :amount' do
        expect(@money.amount).to eq(50)
      end
      it 'allows reading and writing for :currency' do
        expect(@money.currency).to eq('EUR')
      end
    end

    describe '#inspect' do
      it 'prints the output in required format' do
        money = Money.new(50,'EUR')
        allow_any_instance_of(Money).to receive(:p).and_return('50.00 EUR')
        expect(money.inspect).to eq('50.00 EUR')
      end
    end

    describe '.conversion_rates' do
      it 'allows reading and writing for :base_currency' do
        expect(Money.base_currency).to eq('EUR')
      end
      it 'allows reading and writing for :currency_hash' do
        expect(Money.currency_hash['USD']).to eq(1.11)
      end
    end

    describe '#convert_to_base_amount' do
      it 'converts amount in given currency to amount in base currency' do
        money = Money.new(55.50,'USD')
        expect(money.convert_to_base_amount.round(2)).to eq(50.00)
      end
    end

    describe '#convert_to' do
      it 'converts given currency in to different currency' do
        money = Money.new(55.50,'USD')
        expect(money.convert_to('EUR').amount.round(2)).to eq(50.00)
        expect(money.convert_to('EUR').currency).to eq('EUR')
      end
      it 'checks if currency is defined in currency hash' do
        allow_any_instance_of(Money).to receive(:p).and_return(double().as_null_object)
        money = Money.new(55.50,'PKR')
        begin
          money.convert_to_base_amount.round(2)
        rescue SystemExit => e
          expect(e.status).to eq 1 # exited with failure status
        end
      end
    end
  end

end