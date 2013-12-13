source 'https://rubygems.org/'

# Use for heroku
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Custom gems below
gem 'rails-i18n', '~> 4.0.0'

gem 'jquery-turbolinks'

gem 'bootstrap-sass', '~> 3.0.1.0'
gem 'compass-rails', '~> 1.1.2'
gem 'bootstrap-datepicker-rails', '~> 1.1.1.9'

group :development do
  gem 'puma'

  gem 'metric_fu'

  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-bundler'
  gem 'guard-annotate'
  gem 'guard-livereload', require: false

  gem 'letter_opener'

  gem 'better_errors', '~> 1.0.1'
  gem 'binding_of_caller', '~> 0.7.2'
end

group :test do
  gem 'selenium-webdriver', '~> 2.37.0'
  gem 'capybara', '~> 2.1.0'
  gem 'launchy', '~> 2.3.0'

  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'database_cleaner', '~> 1.2.0'
end

group :development, :test do
  gem 'faker', '~> 1.2.0'

  gem 'rspec-rails', '~> 2.14.0'
  gem 'fuubar', '~> 1.2.1'

  gem 'spork-rails', '~> 4.0.0'

  gem 'pry'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'
  gem 'pry-rails'
end

# Use for Heroku
gem 'rails_12factor', group: :production
