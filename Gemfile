# frozen_string_literal: true

source "https://rubygems.org"

gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "sqlite3", ">= 1.4"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem 'interactor'
gem 'active_model_serializers'
gem 'fast_jsonapi'

gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rubocop'
  gem 'rubycritic'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'rails_best_practices'
  gem 'annotate'
  gem 'super_awesome_print'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-core'
  gem 'rspec-rails'
  gem 'database_cleaner-active_record'
  gem 'overcommit'
end

group :development do
  gem "web-console"
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
