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
  @assignment << Assignment.find(params["id"])
  
  assignment_links = CONNECTION.execute("SELECT link FROM links WHERE relative_assignment = #{Assignment.find(1).id}")
  
  @links = []
  
  assignment_links.each do |link|
    @links << link[0]
  end
  
  @assignment << @links
  
  json @assignment

end