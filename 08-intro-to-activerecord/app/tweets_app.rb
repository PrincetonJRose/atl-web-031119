class TweetsApp

  def call
    puts 'Welcome to Twitter'

    puts 'Enter a username:'
    username = STDIN.gets.chomp

    puts 'Enter a message:'
    message = STDIN.gets.chomp

    tweet = Tweet.create(username: username, message: message)

    tweets = Tweet.all
    render(tweets)

    puts "Pick a tweet to edit?"
    tweet_id = gets.chomp.to_i
    puts "What would you like the new message to be?"
    new_message = gets.chomp

    to_edit = Tweet.find(tweet_id)
    to_edit.update(message: new_message)
    # to_edit.message = new_message
    # to_edit.save
  end

  private

  def render(tweets)
    tweets.each do |tweet|
      puts "#{tweet.id}. #{tweet.username} says: #{tweet.message}"
    end
  end
end
