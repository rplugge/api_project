get "/add_assignment" do
  erb :"assignments/add_assignment_form"
end

get "/save_assignment" do
  new_assignment = Assignment.new({"general_info" => params["assignment"]["general_info"], "github_link" => params["assignment"]["github_link"], "co_workers" => params["assignment"]["co_workers"]})
  
  new_assignment.add_to_database
  
  erb :"main/success"
end

get "/view_assignments" do
  erb :"assignments/view_assignments"
end

get "/edit_assignment" do
  erb :"assignments/edit_assignment_list"
end

get "/edit_assignment/:id" do
  erb :"assignments/edit_assignment_form"
end

get "/change_assignment/:id" do
  column = params["edit_choice"]
  
  assignment_object = Assignment.find(params["id"].to_i)

  assignment_object.send("#{column}=", params["new_input"])
  assignment_object.save
  
  erb :"main/success"
end

get "/delete_assignment" do
  erb :"assignments/delete_assignment_list"
end

get "/delete_assignment/:id" do
  assignment_object = Assignment.find(params["id"].to_i)
  assignment_object.delete
  
  erb :"main/success"
end