require 'pry'
require_relative './account'

account1 = BankAccount.new("Brit", 100)
account2 = BankAccount.new("Roni", 500000)

## this is a method definition
def add(x, y)
  # when add runs it binds x and y to the values that were passed
  # x = 17
  # y = 25
  x + y
end

@number1 = 17
@number2 = 25

puts add(17, 25) ## this is a method call

if account1.owners_equal?(account2)
  puts "the owners are equal"
else
  puts "different owners"
end
