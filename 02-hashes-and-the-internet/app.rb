require 'rest-client'
require 'json'
require 'pry'

puts "Welcome to Google Book Searcher"
puts "What sort of books are you looking for today?"

query = gets.chomp
url = "https://www.googleapis.com/books/v1/volumes?q=#{query}"

response = RestClient.get(url)
data = JSON.parse(response.body)

puts "\n\n**Search Results**\n\n"

data['items'].each do |book_info|
  title = book_info['volumeInfo']['title']
  authors = book_info['volumeInfo']['authors'].join(" and ")
  description = book_info['volumeInfo']['description'][0..140]
  puts "=" * 30
  puts "Title: #{title}"
  puts "Authors: #{authors}"
  puts "Description: #{description}"
end
