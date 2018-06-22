source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers', '~> 0.10.0'
gem 'bcrypt', '~> 3.1', '>= 3.1.11', require: false
gem 'carrierwave', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mini_magick', '~> 4.8', require: false
gem 'pg', '~> 0.21', require: false
gem 'puma', '~> 3.11', require: false
gem 'rails', '~> 5.0.6'
gem 'rails_warden'
gem 'rubocop', require: false
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'versionist'

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'pry-byebug', '~> 3.6'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'listen', '~> 3.0', require: false
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
