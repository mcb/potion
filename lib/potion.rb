require 'yaml'
require 'fileutils'
require 'potion/version'

require 'potion/runner'
require 'potion/recipe'
require 'potion/recipe_loader'

module Potion
  POTION_FILE       = 'Potionfile'
  POTION_SUBFOLDER  = 'vendor/potions'
  POTION_STORE_PATH = 'vendor/shelf'
end
