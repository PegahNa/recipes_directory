require_relative './lib/database_connection'
require_relative './lib/recipe_repository'

DatabaseConnection.connect('recipes_directory')
recipe_repository = ResipeRepository.new 
result = recipe_repository.all
result.each_with_index do |recipe, index|
    puts "#{index + 1} - #{recipe.name} - #{recipe.average_cooking_time_in_minutes} - #{recipe.rating}"
end