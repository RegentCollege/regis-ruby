# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'regis/version'

Gem::Specification.new do |s|
  s.name        = 'regis'
  s.required_ruby_version     = '>= 1.9.3'
  s.add_runtime_dependency 'faraday', '~> 0.8', '>= 0.8.0'
  s.add_runtime_dependency 'faraday_middleware', '~> 0.8', '>= 0.8.0'
  s.add_runtime_dependency 'faraday-cookie_jar', '~> 0.0.6', '>= 0.0.6'
  s.add_runtime_dependency 'dalli', '~> 2.7', '>= 2.7.0'
  s.add_development_dependency 'cucumber', '~> 1.3', '>= 1.3.20'
  s.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  s.date        = '2016-01-15'
  s.summary     = "Ruby API connector"
  s.description = "The REGIS API as typed models"
  s.authors     = ["Cameron Tucker"]
  s.email       = 'ctucker@regent-college.edu'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {features}/*`.split("\n")
  s.homepage    = 'https://github.com/RegentCollege/regis-ruby'
  s.license     = 'AGPL'
  s.version     = Regis::VERSION
  s.require_paths = ["lib"]
  s.test_files  = s.files.grep(%r{^(features)/})
end