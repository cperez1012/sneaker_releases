require_relative "./sneaker_releases/version"
require_relative "./sneaker_releases/cli"
require_relative "./sneaker_releases/scraper"
require_relative "./sneaker_releases/sneakers"

require 'pry'
require 'nokogiri'
require 'open-uri'

module SneakerReleases
  class Error < StandardError; end
  # Your code goes here...
end
