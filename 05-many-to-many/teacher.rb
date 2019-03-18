class Teacher
  attr_reader :name, :favorite_dessert, :grumpiness

  def initialize(name, favorite_dessert, grumpiness=0)
    @name = name
    @favorite_dessert = favorite_dessert
    @grumpiness = grumpiness
  end

  def students
    ## Mod.all.select { |m| m.teacher == self }.map { |m| m.student }
    my_mods = Mod.all.select do |mod|
      mod.teacher == self
    end
    my_mods.map { |mod| mod.student }
  end

  def students_with_each
    my_students = []
    Mod.all.each do |mod|
      if mod.teacher == self
        my_students << mod.student
      end
    end
    my_students
  end

end
