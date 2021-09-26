source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise', '~> 4.6', '>= 4.6.2'
gem 'devise-i18n', '~> 1.6', '>= 1.6.2'
gem 'bootstrap', '~> 5.1'
gem 'cancancan', '~> 3.0', '>= 3.0.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.7'

#gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
#gem 'popper_js', '~> 1.14', '>= 1.14.3'
gem 'pg', '~> 1.0'

gem 'toastr-rails', '~> 1.0', '>= 1.0.3'
gem 'client_side_validations', '~> 18.1'

# To check last version and install
gem 'friendly_id', '~> 5.2', '>= 5.2.1'

#This gem integrates the Twitter Bootstrap pagination component with the will_paginate pagination gem
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'

# Helper for add social share feature in your Rails app. Twitter, Facebook, Weibo, Douban, QQ, Tumblr
gem 'social-share-button', '~> 1.1'

#gem 'omniauth', '~> 2.0', '>= 2.0.4'

# A Google OAuth2 strategy for OmniAuth
#gem 'omniauth-google-oauth2', '~> 1.0'

# Facebook OAuth2 Strategy for OmniAuth
#gem 'omniauth-facebook', '~> 8.0'

gem 'activerecord-session_store', '~> 1.1', '>= 1.1.3'

# Gem allows to use `flag-icon-css` - a collection of all country flags in SVG - in your Rails projects
gem 'flag-icons-rails', '~> 3.1'

# Provides object geocoding (by street or IP address)
gem 'geocoder', '~> 1.5'
#gem 'countries', '~> 1.2', '>= 1.2.5'
gem 'countries', require: 'countries/global'

# Geocoding and Places Autocomplete Plugin
gem 'geocomplete_rails', '~> 1.7'

# Chosen is a javascript library of select box enhancer for jQuery and Protoype. 
#gem 'chosen-rails', '~> 1.8', '>= 1.8.7'


gem 'faker', '~> 1.9', '>= 1.9.1'
#gem "select2-rails"

# A jQuery plugin for entering and validating international telephone numbers
gem 'intl-tel-input-rails', '~> 12.3'

# Bootstrap Filestyle (gem version reflects assets version) packaged for rails
gem 'bootstrap-filestyle-rails', '~> 1.2', '>= 1.2.1'

# Use ActiveRecord Sessions
#gem 'activerecord-session_store', '~> 1.0'
gem 'dotenv-rails', groups: [:development, :test, :production]

# Helpers for the reCAPTCHA API
gem "recaptcha", require: "recaptcha/rails"

# CKEditor is a WYSIWYG editor to be used inside web pages
#gem 'ckeditor', '~> 4.2', '>= 4.2.4'

#gem 'nokogiri', '~> 1.8', '>= 1.8.1'

# Create HTML emails, include a CSS file as you do in a normal HTML document and premailer will inline the included CSS.
gem 'premailer-rails', '~> 1.10', '>= 1.10.2'

# Clean ruby syntax for writing and deploying cron jobs.
gem 'whenever', '~> 0.10.0', require: false

# Remotipart is a Ruby on Rails gem enabling remote multipart forms
gem 'remotipart', '~> 1.4', '>= 1.4.2'

#gem 'rubyzip', '~> 1.2.2'
gem 'cookies_eu', '~> 1.7', '>= 1.7.5'


# Use ActiveStorage variant
gem 'mini_magick', '~> 4.11'
#gem 'mimemagic', '~> 0.4.3'


#This gem will configure your application to serve static assets so that you do not need to do this manually in a config file.
#gem 'rails_12factor', group: :production

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'annotate', '~> 2.7', '>= 2.7.4'
end
