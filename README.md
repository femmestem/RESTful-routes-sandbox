# Guide to RESTful routes

The purpose of this app is to learn and practice using RESTful routes to design CRUD applications.
BCrypt user authentication has already been implemented so developers can focus on creating RESTful routes
in the controller and appropriate views. Some views have already been provided to offer inspiration and guidance,
but not all may be needed; this depends on the developer's UX/UI design decisions.

### Quickstart
- 1. Run `$ bundle install`
- 2. Run `$ bundle exec shotgun`

| HTTP Verb     |       Path        | Controller#Action     |                   Used for                    |
|:---------:    |:----------------: |:-----------------:    |:--------------------------------------------: |
| GET           | /users           | users#index          | display a list of all users                  |
| GET           | /users/new       | users#new            | return an HTML form for creating a new user  |
| POST          | /users           | users#create         | create a new user                            |
| GET           | /users/:id       | users#show           | display a specific user                      |
| GET           | /users/:id/edit  | users#edit           | return an HTML form for editing a user       |
| PUT           | /users/:id       | users#update         | update a specific user                       |
| DELETE        | /users/:id       | users#destroy        | delete a specific user                       |

###How to implement PUT/DELETE methods in Sinatra

####Enable Rack::MethodOverride in Sinatra

add ` enable :method_override` to ` config/environment.rb`

#####PUT

VIEW
```
<form action="/users/:id/edit" method="post">
  <input type="hidden" name="_method" value="put" />
</form>
```
CONTROLLER
```
put '/users/:id/edit' do
  user = User.find(params[:id])
  user.update(name:"John")
end
```

####DELETE

VIEW
```
<form action="/users/:id" method="post">
  <input type="hidden" name="_method" value="delete" />
</form>
```
CONTROLLER

```
delete '/users/:id' do
  User.destroy(params[:id])
end
```