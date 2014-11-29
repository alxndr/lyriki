require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "vcr"
require "webmock/rspec"

require "lyriki"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.ignore_hosts "codeclimate.com"
end
