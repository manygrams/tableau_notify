# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tableau_notify/version"

Gem::Specification.new do |s|
  s.name        = "tableau_notify"
  s.version     = TableauNotify::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Evans"]
  s.email       = ["me@nicolasevans.org"]
  s.homepage    = "http://github.com/manygrams/tableau_notify"
  s.summary     = %q{Notifier for Tableau}
  s.description = %q{Shows Apple Notification Center notifcations for Tableau queries against external data sources.}

  s.add_runtime_dependency "file-tail"
  s.add_runtime_dependency "terminal-notifier"

  s.files         = `git ls-files`.split("\n")
  s.executables   = ["tableau-notify"]
  s.require_paths = ["lib"]
end
