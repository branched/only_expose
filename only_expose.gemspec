# -*- encoding: utf-8 -*-
require File.expand_path("../lib/only_expose/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "only_expose"
  s.version     = OnlyExpose::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['chrisharper']
  s.email       = []
  s.homepage    = "https://github.com/branched/only_expose"
  s.summary     = "Methods to expose only specified attributes in ActiveRecord using the helpers to_json and to_xml"

  s.required_rubygems_version = ">= 1.6.2"
  s.rubyforge_project         = "only_expose"

  s.add_development_dependency "bundler", ">= 1.0.10"
  s.add_development_dependency "rspec", "~> 2.5"
  s.add_development_dependency "sqlite3-ruby"
  
  s.add_dependency "activerecord", "~> 3.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end

