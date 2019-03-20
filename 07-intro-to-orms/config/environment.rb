require 'bundler'
Bundler.require

DB = {
  conn: SQLite3::Database.new('db/twitter.db')
}

DB[:conn].results_as_hash = true

require_relative '../lib/basic_orm.rb'
require_relative '../lib/tweet.rb'
require_relative '../lib/tweets_app.rb'

binding.pry
