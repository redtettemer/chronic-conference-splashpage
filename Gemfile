# Force the `github:` syntax to use HTTPS instead of the Git protocol.
# The Git protocol isn't encrypted, and so is subject to MITM attacks.
# This can be removed once Heroku switches to Bundler 2.0.
# https://github.com/bundler/bundler/pull/2569
# You can view the current Heroku Bundler version at
# https://devcenter.heroku.com/articles/ruby-support#libraries.
git_source :github do |repo|
  repo = "#{repo}/#{repo}" unless repo.include? '/'
  "https://github.com/#{repo}.git"
end

source 'https://rubygems.org'

ruby '2.4.0'                    # Heroku documentation highly recommends setting a ruby version number

gem 'rails', '>= 4.2.8'
gem 'pg', '~> 0.21.0'           # A driver for PostgreSQL, the database of choice for Rails
gem 'lograge'                   # Makes our prod logs much easier to grok
gem 'puma'                      # A nice HTTP Server
gem 'protected_attributes'      # For protecting model from mass assignment attacks with attr_accessible
gem 'jquery-rails'              # Gives us easy access to jQuery
gem 'jquery-ui-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'activeadmin', git: 'https://github.com/activeadmin/activeadmin.git'
gem 'devise'
gem 'coffee-rails'
gem 'mandrill-api'

# Useful optional gems
gem 'paperclip'                 # Paperclip is useful for handling file attachments associated with models
gem 'aws-sdk-rails'             # Allow for the storage of Paperclip attachments on S3

group :development do
  gem 'progress_bar'            # For better terminal outputs
  gem 'better_errors'           # For displaying better error pages
  gem 'binding_of_caller'       # For providing an active console on error pages
end

group :production do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'rails_serve_static_assets'
end
