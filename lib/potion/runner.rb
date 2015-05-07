module Potion
  class Runner
    def self.install(recipes)
      recipes.split("\n").each do |recipe|
        elixir = Potion::RecipeLoader.load_yml(recipe)
        if elixir
          recipe = Potion::Recipe.new(elixir)
          recipe.create_potion_dirs
          recipe.load!
          recipe.link_version
          recipe.cleanup
        end
      end
    end

    def self.prune

    end
  end
end
