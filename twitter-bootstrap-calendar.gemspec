$:.push File.expand_path("../lib", __FILE__)
require "twitter/bootstrap/calendar/version"

Gem::Specification.new do |s|
  s.name        = "twitter-bootstrap-calendar"
  s.version     = Twitter::Bootstrap::Calendar::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Christiansen"]
  s.email       = ["dave@trooptrack.com"]
  s.homepage    = "https://github.com/davidray/twitter-bootstrap-calendar"
  s.summary     = %q{Bootstrap based responsive calendar}
  s.description = %q{Adds a helper and 7-column grid for creating calendar views}

  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + Dir["app/**/*"] + ["Rakefile", "README.md"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency             'sass'
  s.add_dependency             'railties',   '>= 3.1'
  s.add_dependency             'actionpack', '>= 3.1'
  # s.add_runtime_dependency 'execjs'
  s.add_development_dependency 'rails', '>= 3.1'
  # s.add_development_dependency 'less'
  # s.add_development_dependency 'therubyracer', '0.10.2'
end
