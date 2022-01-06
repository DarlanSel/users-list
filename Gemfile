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
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
