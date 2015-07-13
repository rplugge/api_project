class Assignment
  
  extend ClassModule
  include InstanceModule
  
  attr_accessor :general_info, :github_link, :co_workers
  attr_reader :id
  
  def initialize(options={})
    @id = options["id"]
    @general_info = options["general_info"]
    @github_link = options["github_link"]
    @co_workers = options["co_workers"]
  end
  
  # - Updates the row new (or same) values
  def save
    CONNECTION.execute("UPDATE assignments SET general_info = '#{self.general_info}', github_link = '#{self.github_link}', co_workers = '#{self.co_workers}' WHERE id = #{self.id};")
  end
  
  # - Deletes row from table
  def delete
    CONNECTION.execute("DELETE FROM assignments WHERE id = #{self.id};")
  end
  
  # - Adds values for the object into a new row in the database
  def add_to_database
    CONNECTION.execute("INSERT INTO assignments (general_info, github_link, co_workers) VALUES ('#{self.general_info}', '#{self.github_link}', '#{self.co_workers}');")
    @id = CONNECTION.last_insert_row_id
    
    return self
  end
  
  def object_as_hash
    hash = {"id" => self.id, "general_info" => self.general_info, "github_link" => self.github_link, "co_workers" => self.co_workers}
    
    return hash
  end
end