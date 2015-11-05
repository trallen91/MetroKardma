source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'angular-rails-templates'
gem 'sprockets', '2.12.3'
gem 'responders', '~> 2.0'

#for the chat
#http://josephndungu.com/tutorials/gmail-like-chat-application-in-ruby-on-rails
gem 'private_pub'
gem 'thin'


gem 'rack-cors', :require => 'rack/cors'

gem 'devise', '~> 3.4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

source "https://rails-assets.org" do
  gem "rails-assets-angular-devise"
end

#https://github.com/cloudspace/angular_devise/issues/36
#https://github.com/jsanders/angular_rails_csrf
#gem 'angular_rails_csrf'

gem 'angular_csrf'


# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'validates_email_format_of'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  gem 'rspec-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

