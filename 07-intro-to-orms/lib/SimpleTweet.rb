class SimpleTweet
  attr_accessor :id, :message, :username

  def initialize(attrs={})
    @id = attrs[:id]
    @message = attrs[:message]
    @username = attrs[:username]
    self.save
  end

  def self.all
    query = "SELECT * FROM tweets ORDER BY id DESC"
    results_array = DB[:conn].execute(query)
    results_array.map do |hash|
      Tweet.new(
        id: hash['id'],
        username: hash['username'],
        message: hash['message']
      )
    end
  end

  def save
    if @id.nil?
      query = <<-SQL
        INSERT INTO tweets (username, message)
        VALUES ("#{self.username}", "#{self.message}")
        SQL
      DB[:conn].execute(query)
    else
      query = <<-SQL
        UPDATE tweets SET username="#{self.username}",message="#{self.message}"
        WHERE id=#{self.id}
        SQL
      DB[:conn].execute(query)
    end
  end
end
