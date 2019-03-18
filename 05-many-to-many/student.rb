class Student
  attr_reader :name, :favorite_movie, :sleepiness

  def initialize(name, favorite_movie, sleepiness=0)
    @name = name
    @favorite_movie = favorite_movie
    @sleepiness = sleepiness
  end

  def teachers
    my_mods = Mod.all.select do |mod|
      mod.student == self
    end
    my_mods.map { |mod| mod.teacher }
  end
end
