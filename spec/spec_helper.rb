# TODO code climate

require "vcr"
require "webmock/rspec"

require "lyriki"

VCR.configure do |c|
  c.cassette_library_dir = "fixtures/vcr_cassettes"
  c.hook_into :webmock
end
