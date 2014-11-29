# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lyriki/version"

Gem::Specification.new do |spec|
  spec.name          = "lyriki"
  spec.version       = Lyriki::VERSION
  spec.authors       = ["Alexander"]
  spec.email         = ["alxndr+gem@gmail.com"]
  spec.summary       = "A wrapper for the LyricsWiki API"
  spec.description   = "A basic Ruby wrapper for the API provided by LyricsWiki (http://lyrics.wikia.com/)."
  spec.homepage      = "http://github.com/alxndr/lyriki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
