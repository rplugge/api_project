get "/add_link" do
  
  erb :"links/add_link_form"
end

get "/save_link" do
  new_link = Link.new({"link" => params["link"]["link_url"], "relative_assignment" => params["link"]["relative_assignment"]})
  
  new_link.add_to_database
  
  erb :"main/success"
end

get "/view_links" do
  erb :"links/view_links"
end

get "/delete_link" do
  erb :"links/delete_link_list"
end

get "/delete_link/:id" do
  link_object = Link.find(params["id"].to_i)
  link_object.delete
  
  erb :"main/success"
end