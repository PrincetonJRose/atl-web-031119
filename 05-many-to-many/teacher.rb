class Teacher
  attr_reader :name, :favorite_dessert, :grumpiness

  def initialize(name, favorite_dessert, grumpiness=0)
    @name = name
    @favorite_dessert = favorite_dessert
    @grumpiness = grumpiness
  end
end
