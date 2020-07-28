module RecipeApp

    class CLI
      
        def initialize
            @input = ""
            @recipes = []
        end

    
        def start
            puts "Hey there! you hungry? lets find some recipes ideas for you."
            
            load_recipe_by_ingredients
            list_results
            
        
          while @input != "exit" 
              ask_for_choices
              break if @input == "exit"
                if @input == "back"
                   load_recipe_by_ingredients
                   list_results
                elsif @input == "list"
                    list_results
                elsif valid_input?
                 puts Recipe.find_by_number(@input).summary
                else
                    puts "Ops! not a valid number. try again."
                end
                
            end
        end


        
        def load_recipe_by_ingredients
            
            loop do
                puts 'Search for recipes with the main ingredient, example: milk, pizza, eggs flour, etc.'
                @input = gets.strip.downcase
                puts
                @recipes = Recipe.search_for_recipes(@input)
                break if @recipes.any? || @input == "exit"
                puts 'No recipes found, please try again'
            end

        end

        def list_results
            @recipes.each.with_index(1) do |recipe, index|
                puts "#{index}. #{recipe.title}"
            end
        end
       

        
        def ask_for_choices
            list_of_choices
            @input = gets.strip
        end

       
       
        def list_of_choices
            puts " "      
            puts "To view more details about the recipe, type it's number and hit enter"
            puts "type 'back' to return to the main menu and do another search"
            puts "type 'list' to show the search results again"
            puts "If you would like to exit the program type 'exit'"
            puts " "
        end

        
        def valid_input?
            @input.to_i.between?(1, Recipe.all.length)
        end
       
    end

end
