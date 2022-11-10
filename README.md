# README

A very small and typical application for the management of Posts, using GraphQL to Rails servers and Apollo for the React client. It has some test with RSpec and Capybara.

Things you may want to cover:

* Ruby version 2.7.6
* Rails version 6.1.6.1
* React version 18.2.0
* Devise version 4.8
* Postgresql version 13

* System dependencies
gem foreman

* Configuration

* Database creation
rails db:create db:migrate

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
bundle install
yarn install
rails db:create db:migrate
Use foreman to start the servers: start -f Procfile.dev
Visit http://localhost:3000
Sign up with an email (just for test) 
Login and create Posts

* ...
