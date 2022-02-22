# Jungle

- Jungle is a mini e-commerce application built with Ruby on Rails 4.2 for purposes of teaching Rails by example.
!["Main page"](https://github.com/nikaffa/Jungle/blob/master/docs/main_page.gif)

## Demo
### User experience
- Once logged in, user can browse items and add the items to their cart. When they are ready to checkout, they can click on the 'Pay with card' button from within their cart. 
- From here they can input the payment information and confirm the payment. Once the order is submitted, the confirmation pops up.
!["Checkout flow"](https://github.com/nikaffa/Jungle/blob/master/docs/checkout.gif)

### Register/login
- Users can create a personal account by filling up the form with the relevant information. Once registered, the user is automatically logged in with their name.
!["Register and login"](https://github.com/nikaffa/Jungle/blob/master/docs/register_login.gif)

### Admin experience
- Admin has access to the admin page by providing the credentials. Once validated, admin can view a Dashboard, Products and Categories Lists.
- From their page, admin can create new category, add new products as well as delete products from the database.
!["Admin - add category"](https://github.com/nikaffa/Jungle/blob/master/docs/admin_new_category.gif)
!["Admin - add products"](https://github.com/nikaffa/Jungle/blob/master/docs/admin_new_product.gif)

## Setup
## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
2. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
3. Remove Gemfile.lock
4. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Run `bin/rails s -b 0.0.0.0` to start the server

## For the checkout and Stripe testing
1. Create .env file based on .env.example
2. Sign up for a Stripe account
3. Put Stripe (test) keys into appropriate .env vars
4. Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

## Dependencies
- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
- Unit testing: Rspec-Rails