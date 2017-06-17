source 'https://rubygems.org'

git_source(:github) do |repo_name|
    repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
    "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'

group :production do
    gem 'rails_12factor'
end

group :development do
    gem 'web-console', '>= 3.3.0'
    gem 'pg'
end

group :development, :test do
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'sqlite3'
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    gem 'pry-rails'
    gem 'rails-controller-testing'
    gem 'faker'
    gem 'shoulda'
    gem 'rspec-rails', '~> 3.5'
    gem 'rails-controller-testing'
end

gem 'listen', '>= 3.0.5', '< 3.2'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '~> 4.0.0.alpha3'


# gem 'redis', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'



#
# group :development do
#   # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
#   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
#   gem 'spring'
#   gem 'spring-watcher-listen', '~> 2.0.0'
# end
