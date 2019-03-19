require 'pry'
require 'date'
require_relative './student'
require_relative './teacher'
require_relative './mod'

safae = Teacher.new('safae', '??????', 1)
brit = Teacher.new('brit', 'chocolate chip cookies', 3)
roni = Teacher.new('roni', 'ice cream cake', 1)
maddie = Student.new('maddie', 'what we do in the shadows', 6)
ansara = Student.new('ansara', 'pride and prejudice', 7)
darcy = Student.new('darcy', 'avengers: infinity war', 1)

start_of_mod1 = Date.new(2019, 03, 11)
Mod.new(brit, maddie, 'ruby', start_of_mod1)
Mod.new(brit, ansara, 'ruby', start_of_mod1)
Mod.new(roni, ansara, 'ruby', start_of_mod1)
Mod.new(safae, ansara, 'javascript', Date.new(2019, 04, 29))

puts 'Good morning!'

binding.pry
