require 'spork'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] = 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  require 'database_cleaner'
  require 'faker'


  Rails.logger.level = 4

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  RSpec.configure do |config|
    config.mock_with :rspec

    config.before(:each) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean
      Rails.cache.clear
    end
  end
end

Spork.each_run do
  FactoryGirl.reload
end