source 'https://rubygems.org'
git_source(:github) { "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 7.0.0'
gem 'bootstrap', '~> 5.1.3'
gem 'carrierwave', '~> 2.0'
gem 'font-awesome-sass', '~> 5.15.1'
gem 'kaminari'
gem 'has_scope'
gem 'sprockets-rails'
gem 'sidekiq'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'redis', '~> 4.0'
gem 'rest-client'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

group :test do
  gem 'capybara', '~> 2.7.0'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
