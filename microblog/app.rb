require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'better_errors'

#Models
require_relative 'models/post.rb'
require_relative 'models/tag.rb'
require_relative 'models/user.rb'

#Controllers
require_relative 'controllers/app_controller.rb'
require_relative 'controllers/post_controller.rb'
require_relative 'controllers/tag_controller.rb'
require_relative 'controllers/user_controller.rb'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'microblog_db',
	host: 'localhost'
})

after { ActiveRecord::Base.connection.close }
