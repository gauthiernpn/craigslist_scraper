require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'pry'
require 'csv'

#This requests the page to be scraped
page = HTTParty.get('https://newyork.craigslist.org/search/pet?s=0')

# This transforms the http response into a nokogiri object.
parse_page = Nokogiri::HTML(page)

# This is an empty array where we will store the craigslist pets.
pets_array = []

# This is where we parse the data.
parse_page.css('.content').css('.row').css('.hdrlnk').map do |a|
  post_name = a.text
  pets_array.push(post_name)
end

Pry.start(binding)
