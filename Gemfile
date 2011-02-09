# teratox Gemfile
source 'http://rubygems.org'

gem 'rails', '3.0.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "haml"
gem "RedCloth"
gem "meta_search"
gem "meta_where"
gem "simple_form"
gem 'will_paginate', '3.0.pre2'
gem 'ancestry', :git => "http://github.com/thoughtbot/ancestry.git", :branch => "rails3"
gem 'nested_form', :git => "git@github.com:adamico/nested_form.git"
gem 'devise'
gem 'cancan'
gem 'barista', '>= 0.5.0'

group :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "nifty-generators"
  gem "rails3-generators"
  gem "haml-rails"
  gem "wirble"
  gem "hirb"
  gem 'annotate-models', '1.0.4'
  gem 'hpricot'
  gem "ruby_parser"
  #gem "code_buddy"
end

group :development, :test do
  gem 'rspec-rails', "~> 2.1"
  gem 'rcov'
  gem 'ruby-debug19'
end

group :test do
  gem 'factory_girl_rails', "~> 1.1.beta1"
  gem "autotest"
  gem 'spork', '0.9.0.rc2'
  gem 'capybara'
  gem 'database_cleaner'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', "~> 2.1"
  gem 'spork', '0.9.0.rc2'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle'
  gem 'factory_girl_rails', "~> 1.1.beta1"
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
