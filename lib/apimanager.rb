require 'pry'
require "action_view"


module RecipeApp

 
    class APImanager

      BASE_URL = "https://api.spoonacular.com/"

        def self.search_for_recipe_from_api(user_input)

            url = BASE_URL + "recipes/search?query=#{user_input}&number=20&" + API_KEY

            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            res = JSON.parse(response.body)
            posts = res["results"]

            posts.map do |post|
                new_hash = {
                    title: post["title"],
                    id: post["id"],
                    
                }
            end
            
        end
        
        def self.get_summary_from_api(recipe_id)
        

            url = BASE_URL + "recipes/#{recipe_id}/summary?" + API_KEY

            uri = URI.parse(url)
            response = HTTParty.get(uri)
            res = JSON.parse(response.body)
            summary = res["summary"]
            ActionView::Base.full_sanitizer.sanitize(summary)
            
        end
       
        
        
    end 
end

