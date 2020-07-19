module RecipeApp

    class CLI
      
        def initialize
            @input = ""
        end

    
        def start
            puts "Hey there! you hungry? lets find some recipes ideas for you."
            
            list_recipe_by_ingredients
            show_summary
            
          while @input != "exit" 
                if @input == "back"
                   list_recipe_by_ingredients
                elsif valid_input?
                 puts Recipe.find_by_number(@input).summary
                else
                    puts "Ops! not a valid number. try again."
                end
                ask_for_choices
            end
        end


        #this method connects to the Recipe class method to dispay a list of recipe given the user input.
        def list_recipe_by_ingredients
            puts "Search for recipes with the main ingredient, example: milk, pizza, eggs, sandwich, ect."
            @input = gets.strip.downcase
            puts " "
            Recipe.search_for_recipes(@input).each.with_index(1) do |recipe, index|
                puts "#{index}. #{recipe.title}"
            end
            
        end
       
        def show_summary
            puts " "
            puts "Show more details about your favorite recipe by typing its number and hit enter"
            @input = gets.strip.downcase
            Recipe.find_by_number(@input)
            puts " "
        end
        
        def ask_for_choices
            list_of_choices
            @input = gets.strip
            start if @input == 'back'
        end

       
       
        def list_of_choices
            puts " "      
            puts "To view more details about the recipe, type it's number and hit enter"
            puts "type 'back' to return to the main menu and do another search"
            puts "If you would like to exit the program type 'exit'"
            puts " "
        end

        #This method will validate the user selection between 1 and how many recipe is displaying
        def valid_input?
            @input.to_i.between?(1, Recipe.all.length)
        end
       
    end

end
