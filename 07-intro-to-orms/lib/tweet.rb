class Tweet < BasicORM
  attr_accessor :id, :message, :username

  def initialize(attrs={})
    @id = attrs[:id]
    @message = attrs[:message]
    @username = attrs[:username]
    self.save
  end

  def save
    if @id.nil?
      query = <<-SQL
        INSERT INTO #{self.class.table_name} (username, message)
        VALUES ("#{self.username}", "#{self.message}")
        SQL
      DB[:conn].execute(query)
    else
      query = <<-SQL
        UPDATE #{self.class.table_name} SET username="#{self.username}",message="#{self.message}"
        WHERE id=#{self.id}
        SQL
      DB[:conn].execute(query)
    end
  end
end
