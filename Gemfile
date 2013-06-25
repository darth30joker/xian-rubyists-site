source 'http://ruby.taobao.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# front end stuff
gem 'haml-rails'
gem 'html5-rails'
gem 'jquery-rails'

group :test do
  gem 'spork', '>= 0.9.0.rc'
  gem 'webmock'
  gem 'database_cleaner'
  gem 'minitest'                # quiet warning in test
end

group :development do
  gem 'thin'
  gem 'guard'
  gem "guard-annotate"
  gem 'guard-rspec'
  gem 'guard-spork'
  gem "guard-bundler"
  gem "guard-livereload"
  gem "guard-jasmine"

  gem 'rb-fsevent', require: false
  gem "better_errors", ">= 0.7.2"
  gem "binding_of_caller"
end

group :test, :development do
  gem 'factory_girl_rails'

  #http://stackoverflow.com/questions/16867707/rails-4-and-rspec-undefined-method-assertions-in-routing-spec
  gem "rspec-rails", '~> 2.14.0.rc1'
  gem 'faker'

  gem 'jasminerice', github: 'bradphelan/jasminerice'

  gem 'pry'
  gem 'pry-debugger'
  gem 'pry-nav'
  gem 'pry-rails'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
