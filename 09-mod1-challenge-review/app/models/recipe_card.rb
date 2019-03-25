class RecipeCard
  attr_reader :recipe, :user, :date, :rating

  @@recipe_cards = []

  def initialize(recipe, user, date, rating)
    @recipe = recipe
    @user = user
    @date = date
    @rating = rating
    @@recipe_cards << self
  end

  def self.all
    @@recipe_cards
  end
end
