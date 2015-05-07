module Potion
  class RecipeLoader
    def self.load_yml(recipe)
      recipe_hash = recipe.gsub(/['",\s(=>)]/, "," => "\n", "\s" => '', "=" => ":", ">" => " ")
      YAML.load(recipe_hash)
    rescue => e
      "Malformed Potionfile. Please review your file. \n #{e}"
    end

    def self.read_file
      File.read(Potion::POTION_FILE)
    end
  end
end
