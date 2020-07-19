require 'httparty'
require_relative "recipe_app/version"
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'pry'
require_relative "../secret"
require_relative "./cli"
require_relative "./apimanager"
require_relative "./recipe"

module RecipeApp
  class Error < StandardError; end
  # Your code goes here...
end
