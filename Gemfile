source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
gem 'bower-rails',               '~> 0.10'
gem 'friendly_id',               '~> 5.1'
gem 'devise',                    '~> 4.2'
gem 'font-awesome-sass',         '~> 4.4'
gem 'paperclip',                 '~> 4.3'
gem 'representable',             '~> 2.3'
gem 'rolify',                    '~> 4.1'

gem 'sass-rails',                '~> 5.0'

gem 'coffee-rails',              '~> 4.1'

gem 'uglifier',                  '~> 2.7'
gem 'validates_timeliness',      '~> 3.0'
gem 'validates_email_format_of', '~> 1.6'
gem 'will_paginate',             '~> 3.0'

gem 'font_assets',               '~> 0.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_girl_rails',      '~> 4.2'
  gem 'rubocop',                 '0.35', require: false 
  gem 'shoulda-matchers',        '~> 2.8'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
