require 'factory_girl'
require 'faker'
require 'database_cleaner'
require_relative '../config'
require_relative 'factories/courses'
require_relative 'factories/students'
require_relative 'factories/enrollments'

ActiveRecord::Migration.suppress_messages do
  require_relative '../db/schema.rb'
end

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
