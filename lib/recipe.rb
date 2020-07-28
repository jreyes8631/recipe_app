require "pry"

module RecipeApp

    class Recipe 

        @@all = []

        def self.all
            @@all 
        end
         
        
        def self.search_for_recipes(search_query)
            @@all =  APImanager.search_for_recipe_from_api(search_query).map  do |recipe_hash| 
                self.new(recipe_hash)
            end
            
        end
        
        
        def self.find_by_number(number) 
            self.all[number.to_i - 1]
        end


        attr_accessor :title, :id, :summary

        def initialize(attributes)
            attributes.each do |attribute_name, attribute_value|
                self.send(("#{attribute_name}="), attribute_value) if self.respond_to?("#{attribute_name}=") 
            end

        end

      
        def summary 
            @summary ||= APImanager.get_summary_from_api(id)
        end 
   end
  
end
