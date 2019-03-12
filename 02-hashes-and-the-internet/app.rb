require 'rest-client'
require 'json'
require 'pry'

def welcome
  puts "Welcome to Google Book Searcher"
end

def get_search_term
  puts "What sort of books are you looking for today?"
  gets.chomp
end

def search_for_books(query)
  url = "https://www.googleapis.com/books/v1/volumes?q=#{query}"
  response = RestClient.get(url)
  JSON.parse(response.body)
end

def process_book(book_info)
  desc = book_info['volumeInfo']['description']
  short_description = desc.length > 140 ? desc[0..140] + '...' : desc
  {
    title: book_info['volumeInfo']['title'],
    authors: book_info['volumeInfo']['authors'].join(" and "),
    description: desc
  }
end

def display_book(data)
  puts "=" * 30
  puts "Title: #{data[:title]}"
  puts "Authors: #{data[:authors]}"
  puts "Description: #{data[:description]}"
end

def run
  welcome
  query = get_search_term
  data = search_for_books(query)
  puts "\n\n**Search Results**\n\n"
  data['items'].each do |book_info|
    book = process_book(book_info)
    display_book(book)
  end
end

run
