# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "variables/version"

Gem::Specification.new do |s|
  s.name        = "variables"
  s.version     = Variable::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Peder Linder"]
  s.email       = ["pederbl@jobstar.se"]
  s.homepage    = "http://rubygems.org/gems/variable"
  s.summary     = %q{Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "variables"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
