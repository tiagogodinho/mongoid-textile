require 'coveralls'
Coveralls.wear!

require 'mongoid-textile'
require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    if Mongoid.respond_to? :connect_to
      Mongoid.connect_to('mongoid-textile') # Mongoid 3
    else
      Mongoid.master = Mongo::Connection.new.db('mongoid-textile') # Mongoid 2
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
