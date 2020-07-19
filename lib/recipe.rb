require 'pry'

module RecipeApp

    class Recipe 

        @@all = []

        def self.all
            @@all 
        end
         
        # This method search for recipes by hitting the API and returns a hash of intance objects and store it on @@all.
        def self.search_for_recipes(search_query)
            @@all =  APImanager.search_for_recipe_from_api(search_query).map  do |recipe_hash| 
                self.new(recipe_hash)
            end
            
        end
        
        #This method retun the recipe object for that number on index.
        def self.find_by_number(number) 
            self.all[number.to_i - 1]
        end


        attr_accessor :title, :id, :summary

        def initialize(attributes)
            attributes.each do |attribute_name, attribute_value|
                self.send(("#{attribute_name}="), attribute_value) if self.respond_to?("#{attribute_name}=") 
            end
        end

        def save
            @@all << self
        end
          
        #This method that goes to the API and stores the ID for recipes.
        def summary 
            @summary ||= APImanager.get_summary_from_api(id)
        end 
   end
  
end
