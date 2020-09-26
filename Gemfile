# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.2.0', require: false
gem 'mini_magick', '~> 4.8'
gem 'pg', '>= 0.18'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0'

gem 'acts_as_api'
gem 'bcrypt', '~> 3.1.7'
gem 'consul'
gem 'email_validator'
gem 'enumerize'
gem 'kaminari'
gem 'rack-attack'
gem 'rack-cors', require: 'rack/cors'
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'smart_error'
gem 'jwt'
gem 'figaro'
gem 'rails_admin', '~> 2.0'
gem "aws-sdk-s3", require: false

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'letter_opener'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'rubocop', require: false

  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.7'
  gem 'shoulda-matchers'
end
