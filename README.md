# Shirt Shop Demo
Very basic app for user to edit shop inventory (add/remove shirts)

## Dependencies
* Bcrypt for password hashing
* Bootstrap, jquery, popper.js for some styling

## Database Initialization
Create, migrate, and seed the database
```
  rails db:create db:migrate db:seed
```

`seeds.rb` contains setup for a user, shop, and some shirts.
You will need to seed in order to use this app because there is no signup page to create a new user

## Database Schema
### Users
* username:string
* password_digest:string
* shop_owner:boolean (this is not really used, but I created it to distringuish between user types, which could be used for allowing access to different shop features)

### Shops
* name:string

### Shirts
* name:string
* description:text
* price_in_cents:integer
* size:string
* color:string

## Relationships
* user has_one shop
* shop belongs_to user
* shop has_many shirts
* shirt belongs_to shop

# Routes
* '/' - redirects to login page or user's page depending on current session
* '/login'
* '/users/:id - user's home (show) page
* '/users/:id/shops/:shop_id - user's shop (show) page
* '/shops/:shop_id/shirts - shop inventory (index), view all shirt info with links to edit/delete
* '/shops/:shop_id/shirts/new - new shirt form

## Deployment
`rails s` to start the server on port 3000

Login with user "admin" password "admin"