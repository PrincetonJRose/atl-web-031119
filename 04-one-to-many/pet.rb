class Pet
  attr_reader :name, :species, :birthday
  attr_accessor :demeanor, :owner

  @@pets = []

  def initialize(name, species, birthday, demeanor='happy')
    @name = name
    @species = species
    @birthday = birthday
    @demeanor = demeanor
    @owner = nil
    @@pets << self
  end

  def self.all
    @@pets
  end
end
