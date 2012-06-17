require "mongoid-textile"
require 'database_cleaner'

RSpec.configure do |config|
  # Remove this line if you don"t want RSpec"s should and should_not
  # methods or matchers
  require "rspec/expectations"
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec

  config.color_enabled 	= true
  config.full_backtrace = true

  config.before(:suite) do
    if Mongoid.respond_to? :connect_to
      Mongoid.connect_to('mongoid-textile')
    else
      Mongoid.configure do |config|
        config.master = Mongo::Connection.new.db('mongoid-textile')
      end
    end

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end