class BasicORM
  def self.table_name
    "#{self.name.downcase}s"
  end

  def self.column_names
    query = "PRAGMA table_info(#{table_name})"
    DB[:conn].execute(query).map {|row| row['name'] }
  end

  def self.non_id_columns
    column_names.drop(1)
  end

  def self.all
    query = "SELECT * FROM #{table_name} ORDER BY id DESC"
    results_array = DB[:conn].execute(query)
    results_array.map do |hash|
      initargs = hash.transform_keys { |key| key.to_sym }
      self.new(initargs)
    end
  end

  def save
    if @id.nil?
      DB[:conn].execute(insert_sql)
    else
      DB[:conn].execute(update_sql)
    end
  end

  private
  def insert_values
    names = self.class.non_id_columns
    sql_array = names.map {|x| "\"#{self.send(x.to_sym)}\"" }
    sql_array.join(', ')
  end

  def insert_sql
    <<-SQL
      INSERT INTO #{self.class.table_name} (#{self.non_id_columns.join(', ')})
      VALUES (#{insert_values})
    SQL
  end

  def update_values
    names = self.class.non_id_columns
    sql_array = names.map {|x| "#{x}=\"#{self.send(x.to_sym)}\"" }
    sql_array.join(', ')
  end

  def update_sql
    <<-SQL
      UPDATE #{self.class.table_name}
      SET #{update_values}
      WHERE id=#{self.id}
    SQL
  end
end
