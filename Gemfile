source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Asset template engines
gem 'json', '1.7.3'
gem 'sass-rails', '3.2.5'
gem 'coffee-script', '2.2.0'
gem 'uglifier', '1.2.6'
gem 'haml', '3.1.6'
gem "formtastic", "~> 2.0.0.rc4"
gem 'jquery-rails', '2.0.2'

gem "pg"

# User engine
gem "devise", '2.1.2'

# Markdown
gem "redcarpet", "~> 2.2.2"
gem "pygments.rb", "~> 0.4.2"
gem 'nokogiri', "~> 1.5.6"

gem "unicorn"


group :development do
  gem "haml-rails", '0.3.4'
  gem "faker", '1.0.1'
  gem "pry"
end

group :test, :development do
  gem 'sqlite3', '1.3.6'
  gem "rspec-rails", '2.10.1'
  gem "spork", '0.9.2'
  gem "capybara", '1.1.2'
  gem "launchy", '2.1.0'
end

group :test, :cucumber do
  gem "factory_girl_rails", '3.5.0'
end

group :production do
  gem "therubyracer", '0.10.1'
  gem "rails_12factor"
end

ruby "2.1.1"
