require "pry"
require "sinatra"
require "sinatra/reloader"

require "sqlite3"

require_relative "database_setup.rb"

require_relative "class_methods.rb"
require_relative "instance_methods.rb"

# Models
require_relative "models/assignment.rb"
require_relative "models/link.rb"

# Controllers
# require_relative "controllers/main.rb"