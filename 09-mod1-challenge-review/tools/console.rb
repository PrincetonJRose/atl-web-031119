require_relative '../config/environment.rb'

brit = User.new
tyler = User.new

soup = Recipe.new
salmon = Recipe.new

RecipeCard.new(soup, brit, '03/21/2019', 4)
RecipeCard.new(salmon, brit, '03/11/2019', 3)
RecipeCard.new(salmon, tyler, '03/01/2019', 2)

# def fail!
#   puts "\n\n\nFAILURE!!!\n\n\n"
# end
# unless salmon.users.include?(brit)
#   fail!
# end
# unless salmon.users.length == 2
#   fail!
# end

binding.pry
