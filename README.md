# Guide to RESTful routes

The purpose of this app is to learn and practice using RESTful routes to design CRUD applications.
BCrypt user authentication has already been implemented so developers can focus on creating RESTful routes
in the controller and appropriate views. Some views have already been provided to offer inspiration and guidance,
but not all may be needed; this depends on the developer's UX/UI design decisions.

### Quickstart

1.  Install packages and dependencies  `$ bundle install`
2.  Create a database  `$ rake db:create`
3.  Migrate the provided Users table to the database  `$ rake db:migrate`
3.  Launch the application server  `$ bundle exec shotgun`

### Troubleshooting

#### PostgreSQL Error

`ActiveRecord::NoDatabaseError: FATAL:  role "postgres" does not exist`

Resolve by running

`$ createuser -s -r postgres`

#### Shotgun Error

```bash
== Shotgun/Thin on http://127.0.0.1:9393/
Thin web server (v1.6.2 codename Doc Brown)
Maximum connections set to 1024
Listening on 127.0.0.1:9393, CTRL+C to stop
/Users/Host/.rvm/gems/ruby-1.9.3-p545/gems/eventmachine-1.0.3/lib/eventmachine.rb:526:in `start_tcp_server': no acceptor (port is in use or requires root privileges) (RuntimeError)
```

Resolve by running

`$ kill -9 $(ps aux | awk '/[s]hotgun/ {print $2}')`

### RESTful Routes

| HTTP Verb     |       Path        | Controller#Action     |                   Used for                    |
|:---------:    |:----------------: |:-----------------:    |:--------------------------------------------: |
| GET           | /users           | users#index          | display a list of all users                  |
| GET           | /users/new       | users#new            | return an HTML form for creating a new user  |
| POST          | /users           | users#create         | create a new user                            |
| GET           | /users/:id       | users#show           | display a specific user                      |
| GET           | /users/:id/edit  | users#edit           | return an HTML form for editing a user       |
| PUT           | /users/:id       | users#update         | update a specific user                       |
| DELETE        | /users/:id       | users#destroy        | delete a specific user                       |

#### How to implement PUT/DELETE methods in Sinatra

Enable Rack::MethodOverride in Sinatra

add ` enable :method_override` to ` config/environment.rb`

##### PUT

View
```
<form action="/users/:id/edit" method="post">
  <input type="hidden" name="_method" value="put" />
</form>
```
Controller
```
put '/users/:id/edit' do
  user = User.find(params[:id])
  user.update(name:"John")
end
```

#### DELETE

View
```
<form action="/users/:id" method="post">
  <input type="hidden" name="_method" value="delete" />
</form>
```
Controller

```
delete '/users/:id' do
  User.destroy(params[:id])
end
```

### Contributing

We would love for you to help make the skeleton more awesome. There are three ways to contribute:

1. Ask for a bug fix or enhancement
2. Submit a pull request for a bug fix or enhancement
3. Code review an open pull request

Be prepared to give and receive specific, actionable, and kind feedback!