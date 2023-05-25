require_relative './recipe'

class RecipeRepository
    def all
        sql = 'SELECT id, name, average_cooking_time_in_minutes, rating FROM recipes;'
        result_set = DatabaseConnection.exec_params(sql, [])

        recipes = []

        result_set.each do |record|
            recipe = Recipe.new
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.average_cooking_time_in_minutes = record['average_cooking_time_in_minutes']
            recipe.rating = record['rating']
            recipes << recipe
        end
        return recipes
    end
    
    def find(id)
        sql = 'SELECT id, name, average_cooking_time_in_minutes, rating FROM recipes WHERE id = $1;'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)
        recipe = Recipe.new
        record = result_set[0]
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.average_cooking_time_in_minutes = record['average_cooking_time_in_minutes']
            recipe.rating = record['rating']
        return recipe
    end
end