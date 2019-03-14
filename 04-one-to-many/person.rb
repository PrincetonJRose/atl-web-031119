class Person
  self.attr_reader(:name, :age)
  attr_accessor :pets
  ## attr_reader, attr_writer, attr_accessor

  def initialize(name, age, pets=[])
    @name = name
    @age = age
    @pets = pets
  end

  def adopt(pet)
    pet.owner = self
    self.pets << pet
  end

  def donate(friend, pet)
    friend.pets << pet
    pet.owner = friend
  end

  ## attr readers give you this
  # def age
  #   @age
  # end
  #
  # def name
  #   @name
  # end

  ## Attr writers give you this
  # def name=(new_name)
  #   @name = new_name
  # end

  ## attr accessors give you both

end
