class Tweet < BasicORM
  attr_accessor :id, :message, :username

  def initialize(attrs={})
    @id = attrs[:id]
    @message = attrs[:message]
    @username = attrs[:username]
    self.save
  end
end
