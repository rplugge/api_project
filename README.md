# Assignment Api

## View All Assignment
### /api/assignments
Returns all assignments in json

## View an Assignment by ID
### /api/assignments/:id
Example: 'api/assignments/1'

Returns json for a specified assignment

## View All Links
### /api/links
Returns all links in json

## Add Assignment
### /api/add_assignment
Adds an assignment with the paramaters specified in the url.
Uses variables (seperated by &)

- general_info = Assignment Name
- github_link = Link to the assignment
- co_workers = Other people contributing the the assignment

Example: /api/add_assignment?general_info=Barcamp&github_link=http:my_page.come&co_workers=Rob

## Add Link
### /api/add_link
Adds a link with the paramaters specified in the url.
Uses variables (seperated by &)

- link = the link
- relative_assignment = the assignment ID the link is for

Example: /api/addlink?link=http:my_link.com&relative_assignment=1

## Delete Link
### /api/delete_link/:id
Deletes a link with the specified ID

Example: /api/delete_link/1

## Delete Assignment
### /api/delete_assignment/:id
Deletes an assignment with the specified ID

Example: /api/delete_assignment/1