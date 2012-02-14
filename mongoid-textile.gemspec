# encoding: UTF-8

require File.expand_path('../lib/mongoid-textile/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lucas Renan", "Tiago Rafael Godinho"]
  gem.email         = ["contato@lucasrenan.com", "tiagogodinho3@gmail.com"]
  gem.description   = %q{Textile texts directly from MongoDB.}
  gem.summary       = %q{Mongoid Textile caches Textile texts on MongoDB to eliminate reprocessing.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "mongoid-textile"
  gem.require_paths = ["lib"]
  gem.version       = Mongoid::Textile::VERSION
  
  gem.add_dependency 'mongoid',  '~> 2.4.0'
  gem.add_dependency 'RedCloth', '~> 4.2.0'
  
  gem.add_development_dependency 'rspec', '~> 2.8.0'
end
