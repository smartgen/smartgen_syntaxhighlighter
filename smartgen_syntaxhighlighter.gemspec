# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "smartgen_syntaxhighlighter/version"

Gem::Specification.new do |s|
  s.name        = "smartgen_syntaxhighlighter"
  s.version     = Smartgen::Syntaxhighlighter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vicente Mundim"]
  s.email       = ["vicente.mundim"]
  s.homepage    = ""
  s.summary     = %q{Adds Syntax Highlighter support for smartgen}
  s.description = %q{Use Syntax Highlighter plugin when generating files with smartgen}

  s.rubyforge_project = "smartgen_syntaxhighlighter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  
  s.add_dependency "smartgen"
  
  s.add_development_dependency "rspec", ">= 2.3.0"
end
