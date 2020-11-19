source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.1"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "config"
gem "dotenv-rails"
gem "faker", "~> 2.14"
gem "http_accept_language", "~> 2.0", ">= 2.0.5"
gem "jbuilder"
gem "jwt"
gem "kaminari"
gem "mysql2", ">= 0.4.4"
gem "puma", "~> 4.1"
gem "rack-cors"
gem "rails", "~> 6.0.3", ">= 6.0.3.3"
gem "ransack"

group :development do
  gem "airborne"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "database_cleaner-active_record"
  gem "factory_bot_rails"
  gem "hirb"
  gem "irb"
  gem "listen", "~> 3.2"
  gem "rails_best_practices", "~> 1.20"
  gem "rspec-rails"
  gem "rubocop", "~> 0.89.1"
  gem "rubocop-rails", "~> 2.3.2", require: false
  gem "shoulda-matchers", "~> 4.0"
  gem "simplecov", require: false
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "aws-sdk-s3", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
