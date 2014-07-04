# A sample Gemfile
source "https://rubygems.org"

gem "sinatra"
gem "sinatra-activerecord"
gem "sqlite3"

group :test do
  gem "rack-test", require: "rack/test"	
  gem 'capybara'
  gem 'poltergeist'
end

group :development, :test do
  gem "rspec"
  gem "pry"
  gem "database_cleaner"
end