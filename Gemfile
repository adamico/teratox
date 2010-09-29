# teratox Gemfile
source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "haml"
gem "RedCloth"
gem "meta_search"
gem "meta_where"
gem "formtastic", "~> 1.1.0"
gem 'will_paginate', '3.0.pre'
gem "calendar_date_select", :git => 'http://github.com/locksmithdon/calendar_date_select.git', :branch => "jqueryrails3"
gem 'pickle'

group :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "nifty-generators"
  gem "rails3-generators"
  gem "rails_best_practices"
  gem "haml-rails"
  gem "wirble"
  gem "hirb"
  gem 'annotate-models', '1.0.4'
  gem 'faker', '0.3.1'
end

group :development, :test do
  gem 'rspec-rails', ">= 2.0.0.beta.20"
  gem "webrat"
end

group :test do
  gem 'factory_girl_rails'
  gem "ZenTest"
  gem "autotest-notification"
  gem "autotest-rails"
  gem 'spork'
  gem "webrat"
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', ">= 2.0.0.beta.20"
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
  gem 'factory_girl_rails'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
