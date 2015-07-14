get "/api/assignments" do
  @assignments = Assignment.all
  @assignment_hash = []
  
  @assignments.each do |assignment|
    @assignment_hash << assignment.object_as_hash
  end
  
  json @assignment_hash
end

get "/api/assignments/:id" do
  @assignment = []
  @assignment << Assignment.find(params["id"]).object_as_hash
  
  assignment_links = CONNECTION.execute("SELECT link FROM links WHERE relative_assignment = #{Assignment.find(params["id"]).id}")
  
  @links = []
  
  assignment_links.each do |link|
    @links << link[0]
  end
  
  @assignment << @links
  
  json @assignment

end

get "/api/links" do
  links = Link.all
  link_hash = []
  
  links.each do |link|
    link_hash << link.object_as_hash
  end
  
  json link_hash
end

get "/api/add_assignment" do
  assignment = Assignment.new({"general_info" => params["general_info"], "github_link" => params["github_link"], "co_workers" => params["co_workers"]})
  assignment.add_to_database
  assignment = assignment.object_as_hash
  
  json assignment
end

get "/api/add_link" do
  link = Link.new({"link" => params["link"], "relative_assignment" => params["relative_assignment"].to_i})
  link.add_to_database
  link = link.object_as_hash
  
  json link
end

get "/api/delete_link/:id" do
  link = Link.find(params["id"])
  link.delete
  
  return "Deleted!"
end

get "/api/delete_assignment/:id" do
  assignment = Assignment.find(params["id"])
  assignment.delete
  
  return "Deleted!"
end