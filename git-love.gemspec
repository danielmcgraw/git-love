$:.push File.expand_path("../lib", __FILE__)
require "git-love/version"

Gem::Specification.new do |s|
  s.name          = 'git-love'
  s.version       = GitLove::VERSION
  s.date          = '2013-09-20'
  s.summary       = "A git user manager for switching, pairing, and project specific user configuration."
  s.description   = "A git user manager allowing for easy switching, pairing, and project specific user configuration."
  s.authors       = ["Daniel McGraw"]
  s.email         = 'dan.j.mcgraw@gmail.com'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.homepage      = 'http://github.com/danielmcgraw/git-love'
  s.license       = 'MIT'
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'

end