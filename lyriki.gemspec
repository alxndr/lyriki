# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lyriki/version"

Gem::Specification.new do |s|
  s.name          = "lyriki"
  s.version       = Lyriki::VERSION
  s.authors       = ["Alexander"]
  s.email         = ["alxndr+gem@gmail.com"]
  s.summary       = "A wrapper for the LyricsWiki API"
  s.description   = <<-DESC
    A basic Ruby wrapper for the API provided by LyricsWiki (http://lyrics.wikia.com/).

    Currently only implements fetching artist data, song data, and song lyrics.
  DESC
  s.homepage      = "http://github.com/alxndr/lyriki"
  s.license       = "MIT"

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency "json"
  s.add_runtime_dependency "nokogiri"

  s.add_development_dependency "bundler", "~> 1.6"
  s.add_development_dependency "rake"
end
