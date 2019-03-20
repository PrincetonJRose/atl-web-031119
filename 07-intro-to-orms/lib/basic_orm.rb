class BasicORM
  def self.table_name
    "#{self.name.downcase}s"
  end

  def self.column_names
    DB[:conn].execute("PRAGMA table_info(#{table_name})").map {|row| row['name'] }
  end

  def self.all
    query = "SELECT * FROM #{table_name} ORDER BY id DESC"
    results_array = DB[:conn].execute(query)
    results_array.map do |hash|
      initargs = hash.transform_keys { |key| key.to_sym }
      self.new(initargs)
    end
  end
end
