class RecipeFacade
  def self.recipes_by_country(country)
    recipes = RecipesService.recipes_by_country(country)
    recipes[:hits].map { |recipe| Recipe.new(recipe, country) }
  end
end