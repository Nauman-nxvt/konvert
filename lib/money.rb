module Konvert
  require 'pry'
  require_relative '../lib/operations'
  class Money
    include Konvert::Operations

    attr_accessor :amount
    attr_accessor :currency

    def self.conversion_rates(base,currency_hash)
      @@base_currency = base
      @@currency_hash = currency_hash
    end

    def self.base_currency
      @@base_currency
    end

    def self.currency_hash
      @@currency_hash
    end

    def initialize(amount, currency)
      @amount = amount
      @currency = currency
    end

    def inspect
      p sprintf('%.2f', amount) + ' ' + currency
    end

    def convert_to_base_amount
      return unless (conversion_rates_set? && currency_defined?)
      self.currency == Money.base_currency ? self.amount : self.amount /  Money.currency_hash[self.currency]
    end

    def convert_to(to_currency)
      return unless (conversion_rates_set? && currency_defined?)
      if to_currency == Money.base_currency
        amount =  self.convert_to_base_amount
      else
        amount_in_base = self.convert_to_base_amount
        amount = amount_in_base * Money.currency_hash[to_currency]
      end
      Money.new(amount, to_currency)
    end

    def conversion_rates_set?
      if (defined?(@@base_currency)).nil? || (defined?(@@currency_hash)).nil?
        p "Conversion rates not set: Please set conversion rates first."
        exit(false)
        #abort 'Conversion rates not set: Please set conversion rates first.'
      else
        true
      end
    end
    def currency_defined?
      unless (@@currency_hash.key?(self.currency) || self.currency == @@base_currency)
        p "Invalid currency: Rates for #{self.currency} not defined in currency hash"
        exit(false)
        #abort "Invalid currency: Rates for #{self.currency} not defined in currency hash"
      else
        true
      end
    end
  end
end