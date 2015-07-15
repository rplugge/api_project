require "pry"
require "sinatra"
require "sinatra/reloader"
require "sinatra/json"
require 'sinatra/cross_origin'
require 'bcrypt'

configure do
  enable :cross_origin
end

set :sessions, true

require "sqlite3"

require_relative "database_setup.rb"

require_relative "class_methods.rb"
require_relative "instance_methods.rb"

# Models
require_relative "models/assignment.rb"
require_relative "models/link.rb"
require_relative "models/user.rb"

# Controllers
require_relative "controllers/api_controller.rb"
require_relative "controllers/main.rb"
require_relative "controllers/assignment_controller.rb"
require_relative "controllers/link_controller.rb"