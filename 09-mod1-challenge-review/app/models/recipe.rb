class Recipe
  @@recipes = []

  def initialize
    @@recipes << self
  end

  def users
    cards = RecipeCard.all.select do |card|
      card.recipe == self
    end
    # users = []
    # cards.each do |card|
    #   users << card.user
    # end
    # users
    cards.map { |card| card.user }
  end

  def self.all
    @@recipes
  end

  def self.most_popular
    self.all.max_by { |x| x.users.length }
    # highest = self.all.first
    # self.all.each do |recipe|
    #   if recipe.users.length > highest.users.length
    #     highest = recipe
    #   end
    # end
    # highest
  end
end
