# teratox Gemfile
source 'http://rubygems.org'

gem 'rails', "3.1.0.rc3"

# Bundle edge Rails instead:
# gem 'rails', :git => 'https://github.com/rails/rails.git'

# assets pipeline
gem "haml"
gem "sass-rails"
gem "uglifier"
gem 'coffee-script'
gem 'jquery-rails'

gem "RedCloth"
gem "ransack", :git => "https://github.com/ernie/ransack.git"
gem "squeel", :git => "https://github.com/ernie/squeel.git"

gem "simple_form"

gem 'kaminari'
gem 'ancestry'
gem 'nested_form'
gem 'devise'
gem 'cancan'
gem 'barista', '~> 1.0'
gem 'rails_admin', :git => 'git@github.com:adamico/rails_admin.git'

group :development do
  gem 'sqlite3'
  gem "nifty-generators"
  gem "rails3-generators"
  gem "haml-rails"
  gem "wirble"
  gem "hirb"
  gem 'annotate-models', '1.0.4'
  gem 'hpricot'
  gem "ruby_parser"
end

group :development, :test do
  gem 'rspec-rails', "~> 2.1"
  gem 'rcov'
end

group :test do
  gem 'factory_girl_rails', '~> 1.1.beta1'
  gem "autotest"
  gem 'spork', '~> 0.9.0.rc2'
  gem 'capybara'
  gem 'database_cleaner'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'rspec-rails', "~> 2.1"
  gem 'spork', '~> 0.9.0.rc2'
  gem 'launchy'    # So you can do Then show me the page
  gem 'pickle', :git => "git@github.com:adamico/pickle.git"
  gem 'factory_girl_rails', '~> 1.1.beta1'
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
