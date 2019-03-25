class User
  def recipe_cards
    RecipeCard.all.select do |card|
      card.user == self
    end
  end

  def recipes
   self.recipe_cards.map { |c| c.recipe }
  end

  def top_3_recipes
    self.recipe_cards.sort_by { |x| -x.rating }.take(3).map { |c| c.recipe }
  end
end
