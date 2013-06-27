#
# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = 'spunkmeyer'
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = [ 'Tim Miller' ]
  s.email       = [ '' ]
  s.homepage    = 'https://github.com/echohead/spunkmeyer'
  s.summary     = %q{extracts cookies from browser databases.}
  s.description = %q{extracts cookies from browser databases.}

  s.required_ruby_version     = ">= 1.9.1"
  s.required_rubygems_version = ">= 1.3.7"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency     'colorize',  '>= 0'
  s.add_runtime_dependency     'sqlite3',   '>= 0'
  s.add_development_dependency 'rake',      '>= 0'
  s.add_development_dependency 'rspec',     '>= 0'
end
