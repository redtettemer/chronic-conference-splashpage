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

ruby '2.3.0'

gem 'rails', '~>4.2'            # Ruby on Rails framework
gem 'pg'                        # PostgreSQL
gem 'lograge'                   # Makes our prod logs much easier to grok
gem 'puma'                      # A nice HTTP Server
gem 'foreman'                   # Use unicorn locally
gem 'paperclip'                 # For attaching files 
gem 'protected_attributes'      # For protecting model from mass assignment attacks with attr_accessible
gem 'jquery-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'roo', '~> 2.4'
gem 'activeadmin', github: 'activeadmin'
gem 'devise'

group :production do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'dalli'     
  gem 'memcachier'
  gem 'rails_serve_static_assets'
end

group :development do
  gem 'progress_bar'      # For better terminal outputs
  gem 'better_errors'     # For displaying better error pages
  gem 'binding_of_caller' # For providing an active console on error pages
end
