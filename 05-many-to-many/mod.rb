class Mod
  attr_reader :teacher, :student, :subject, :start_date

  @@mods = []

  def initialize(teacher, student, subject, start_date)
    @teacher = teacher
    @student = student
    @subject = subject
    @start_date = start_date
    @@mods << self
  end

  def self.all
    @@mods
  end
end
