# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.6.3"

gem "rails", "~> 6.0.3", ">= 6.0.3.1"
gem "mysql2", ">= 0.4.4"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "jbuilder", "~> 2.7"


gem "bootsnap", ">= 1.4.2", require: false
gem "enumerize"

#ファイル関連
gem "rubyzip"
gem "shrine", "~> 3.0"
gem 'image_processing'
gem 'mini_magick'

group :development, :test do
  # debug
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry"
  gem "better_errors"
  gem "binding_of_caller"
  # rspec
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "rails-controller-testing"
  # LintTools
  gem "rubocop", "~> 0.85.1", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-performance", require: false
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
