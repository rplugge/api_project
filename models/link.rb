class Link
  
  extend ClassModule
  include InstanceModule
  
  attr_accessor :link, :relative_assignment
  attr_reader :id
  
  def initialize(options={})
    @id = options["id"]
    @link = options["link"]
    @relative_assignment = options["relative_assignment"]
  end
  
  # - Updates the row new (or same) values
  def save
    CONNECTION.execute("UPDATE links SET link = '#{self.link}', relative_assignment = '#{self.relative_assignment}' WHERE id = #{self.id};")
  end
  
  # - Deletes row from table
  def delete
    CONNECTION.execute("DELETE FROM links WHERE id = #{self.id};")
  end
  
  # - Adds values for the object into a new row in the database
  def add_to_database
    CONNECTION.execute("INSERT INTO links (link, relative_assignment) VALUES ('#{self.link}', '#{self.relative_assignment}');")
    @id = CONNECTION.last_insert_row_id
    
    return self
  end
  
  def object_as_hash
    hash = {"id" => self.id, "link_url" => self.link, "relative_assignment" => self.relative_assignment}
    
    return hash
  end
end