require "mongoid-textile"

RSpec.configure do |config|
  # Remove this line if you don"t want RSpec"s should and should_not
  # methods or matchers
  require "rspec/expectations"
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec

  config.color_enabled 	= true
  config.full_backtrace = true

  config.before :suite do
  	Mongoid.configure do |config|
  	  config.master = Mongo::Connection.new.db("mongoid-textile")
  	end
  end

  config.after :each do
    Mongoid.master.collections.select {|c| c.name !~ /^system/ }.each(&:drop)
  end

  config.after :suite do
    Mongoid.master.connection.drop_database("mongoid-textile")
    Mongoid.master.connection.close
  end
end