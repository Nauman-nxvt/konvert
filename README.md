# Konvert

Konvert is a Ruby command line gem that lets you convert between different currencies and perform arithmetic operations on them from the command line. Just set the currency rates and have fun..  

## Installation

 install it as:

    $ gem install konvert

## Usage

1- After installing the gem, enter irb console and require konvert:

    irb(main): require 'konvert'

2- Configure the currency rates with respect to a base currency (here EUR):

    irb(main): Money.conversion_rates('EUR', {
        'USD'     => 1.11,
        'Bitcoin' => 0.0047
      })

3- You can perform the operations now. Examples:
   1) Create a Money object  
    
    irb(main): five_euro = Konvert::Money.new(5,'EUR)
   2) Convert to different currency
    
    irb(main): five_euro.convert_to('USD') 
   3) Add two Money objects. They can be of same or different currencies
   
    irb(main): fifty_eur + twenty_dollars                # => 68.02 EUR
    irb(main): fifty_eur - twenty_dollars                  # => 31.98 EUR

 
   4) Divide or multiply a Money object with an integer
    
    irb(main): fifty_eur / 2                         # => 25 EUR
    irb(main): twenty_dollars * 3             # => 60 USD
   
  
   5) Perform Comparisons (same currencies or in different currencies):  
    
    irb(main): twenty_dollars == Money.new(20, 'USD')          # => true
    irb(main): twenty_dollars == Money.new(30, 'USD')          # => false
    irb(main): twenty_dollars > Money.new(5, 'USD')               # => true
    irb(main): twenty_dollars < fifty_eur                                    # => true
    
 

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

