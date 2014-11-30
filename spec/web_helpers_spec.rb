require "spec_helper"
require "web_helpers"

describe WebHelpers do

  subject { Class.new { include WebHelpers }.new }

  describe "#url_encode" do
    it "should replace apostrophes" do
      encoded = subject.url_encode("foo's bar")

      expect(encoded).not_to include "'"
      expect(encoded).to include "%27"
    end
  end

  describe "#get" do
    it { is_expected.to respond_to :get }
    it "should hit Net::HTTP"
    it "should use URI"
  end

end
