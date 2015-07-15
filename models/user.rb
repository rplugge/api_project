class User
  
  extend ClassModule
  include InstanceModule
  
  attr_accessor :name, :password
  attr_reader :id
  
  def initialize(options={})
    @id = options["id"]
    @name = options["name"]
    @password = options["password"]
  end
  
  # - Updates the row new (or same) values
  def save
    CONNECTION.execute("UPDATE users SET name = '#{self.name}', password = '#{self.password}' WHERE id = #{self.id};")
  end
  
  # - Deletes row from table
  def delete
    CONNECTION.execute("DELETE FROM users WHERE id = #{self.id};")
  end
  
  # - Adds values for the object into a new row in the database
  def add_to_database
    CONNECTION.execute("INSERT INTO users (name, password) VALUES ('#{self.name}', '#{self.password}');")
    @id = CONNECTION.last_insert_row_id
    
    return self
  end

end