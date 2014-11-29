require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "lyriki"

# order matters
require "webmock/rspec"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  c.configure_rspec_metadata!
  c.hook_into :webmock
  c.ignore_hosts "codeclimate.com"
end
