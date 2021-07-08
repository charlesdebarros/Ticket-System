source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# https://rubygems.org/gems/carrierwave
gem 'carrierwave', '~> 2.2', '>= 2.2.1'
# https://rubygems.org/gems/devise
gem 'devise', '~> 4.7', '>= 4.7.3'
# https://rubygems.org/gems/font_awesome5_rails
gem 'font_awesome5_rails', '~> 1.3', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.3', '>= 5.3.1'
# https://rubygems.org/gems/pundit
gem 'pundit', '~> 2.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6.0.0'
# https://rubygems.org/gems/simple_form
gem 'simple_form', '~> 5.1', '>= 5.1.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.2', '>= 5.2.1'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # https://rubygems.org/gems/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.1', '>= 6.1.0'
  # https://rubygems.org/gems/pry
  gem 'pry', '~> 0.13.1'
  # https://github.com/rspec/rspec-rails/tree/4-0-maintenance
  gem 'rspec-rails', '~> 4.0', '>= 4.0.2'
end

group :test do
  # https://github.com/teamcapybara/capybara#setup
  gem 'capybara', '~> 3.35', '>= 3.35.3'
  # https://github.com/simplecov-ruby/simplecov
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
end
