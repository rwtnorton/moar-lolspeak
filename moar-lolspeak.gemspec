# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "moar-lolspeak/version"

Gem::Specification.new do |s|
  s.name        = "moar-lolspeak"
  s.version     = Moar::Lolspeak::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Richard Norton"]
  s.email       = ["rwtnorton@gmail.com"]
  s.homepage    = "https://github.com/rwtnorton/moar-lolspeak"
  s.summary     = %q{Translates from English to lolspeak.}
  s.description = %q{Shameless copy of CPAN module Acme::LOLCAT.}

  s.rubyforge_project = "moar-lolspeak"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec", "~> 2.5.0"
end
