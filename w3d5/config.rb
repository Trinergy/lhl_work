require 'sinatra/activerecord'
require 'active_record'
require 'active_support/all'
require 'pry'
require_relative 'models/course'
require_relative 'models/student'
require_relative 'models/enrollment'

ActiveRecord::Base.establish_connection(
  adapter: :sqlite3,
  database: 'db/db.sqlite3'
)
