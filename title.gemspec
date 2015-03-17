$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "title/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "title"
  s.version     = Title::VERSION
  s.authors     = ["Anil Yadav"]
  s.email       = ["1993anilyadav@gmail.com"]
  s.homepage    = "http://www.anilyadav.in"
  s.summary     = "Gem Demo for Pages Title"
  s.description = "Easy To Set Title of Every Page"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
