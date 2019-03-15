class Student
  attr_reader :name, :favorite_movie, :sleepiness

  def initialize(name, favorite_movie, sleepiness=0)
    @name = name
    @favorite_movie = favorite_movie
    @sleepiness = sleepiness
  end
end
