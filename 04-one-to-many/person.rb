class Person
  self.attr_reader(:name, :age)
  ## attr_reader, attr_writer, attr_accessor

  def initialize(name, age)
    @name = name
    @age = age
  end

  def pets
    Pet.all.select do |pet|
      pet.owner == self
    end
  end

  def adopt(pet)
    pet.owner = self
  end

  def donate(friend, pet)
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
