require 'pry'
require_relative './person'
require_relative './pet'

puts "Good morning!"

brit = Person.new('Brit', 32)
seyla = Pet.new('Seyla', 'Dog', 'June')
jurgen = Pet.new('Jurgen', 'Dog', 'December')
## brit = Person.new('Brit', 32, [seyla, jurgen])

roni = Person.new('Roni', 23)

brit.adopt(jurgen)
brit.adopt(seyla)

brit.donate(roni, seyla)

binding.pry
