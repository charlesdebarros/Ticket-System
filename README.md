# Ticket System

A simple ticket generator and tracking system built using Ruby on Rails.

### Main technologies used

* Ruby 2.7.X
* Rails 6.1
* PostgresSQL

#### Gems

* [RSpec Rails](https://rubygems.org/gems/rspec-rails)
* [Capybara](https://rubygems.org/gems/capybara)
* [Factory Bot Rails](https://rubygems.org/gems/factory_bot_rails)
* [SimpleCov](https://rubygems.org/gems/simplecov)
* [Pry](https://rubygems.org/gems/pry)
* [RubyCritic](https://rubygems.org/gems/rubycritic)

### Downloading (or Cloning) and running the app

If you would like to have a go at Ticket System, please follow the following steps:

1. Download the .zip file or clone Ticket System using the `git clone` command.
1. If using a .zip file, unzip it.
1. CD into the project folder.
1. Run `bundle install` - make sure you are using the same Ruby version as the project. At this moment in time, Ticket System is using `Ruby 2.7.2`.
1. After `Bundler installation` is complete, run `rails webpacker:install` to install the application's Javascript environment.
1. Lastly, please remember to create and migrate the applications's database using `rails db:create db:migrate` command.
1. Finally, run `rails server` to start the app and go to `localhost:3000` to see the project.

Have fun!