class Pet
  attr_reader :name, :species, :birthday
  attr_accessor :demeanor, :owner

  def initialize(name, species, birthday, demeanor='happy')
    @name = name
    @species = species
    @birthday = birthday
    @demeanor = demeanor
    @owner = nil
  end
end
