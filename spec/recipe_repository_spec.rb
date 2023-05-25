require 'recipe_repository'

RSpec.describe RecipeRepository do
    def reset_recipes_table
        seed_sql = File.read('spec/seeds_recipe.sql')
        connection = PG.connect({host: '127.0.0.1', dbname: 'recipes_directory_test'})
        connection.exec(seed_sql)
    end

    before(:each) do
        reset_recipes_table
    end

        it 'returns the list of recipes' do
            repo = RecipeRepository.new
            recipes = repo.all
            expect(recipes.length).to eq(2)
            expect(recipes[0].id).to eq ('1') 
            expect(recipes[0].name).to eq('fish') 
            expect(recipes[0].average_cooking_time_in_minutes).to eq('30')
            expect(recipes[0].rating).to eq('10')
        end

        it 'returns fish as a sinle recipe' do
            repo = RecipeRepository.new
            recipe = repo.find(1)
            expect(recipe.name).to eq('fish')
            expect(recipe.average_cooking_time_in_minutes).to eq('30')
            expect(recipe.rating).to eq('10')
        end

    end

