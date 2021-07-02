source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'rails', '~> 6.1.0'
gem 'mysql2', '~> 0.5'
gem 'puma', '5.3.2'
gem 'jbuilder', '~> 2.7'
gem 'actionmailer'
gem 'bcrypt', '~> 3.1.7'
gem 'active_hash'
gem 'jwt'
gem 'simple_command'
gem 'config'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'
gem 'carrierwave'
gem 'rack-cors'
gem 'fog-aws'
gem 'firebase-auth-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'pry-rails'
  gem "letter_opener_web"
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'annotate'
  gem 'spring'
end

group :production do
  gem 'spring'
  gem 'mysql2', '~> 0.5'
  gem 'unicorn', '5.4.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
