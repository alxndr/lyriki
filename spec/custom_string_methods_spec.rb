require "spec_helper"

describe CustomStringMethods do

  String.instance_eval do
    include CustomStringMethods
  end

  describe "#url_encode" do
    it "should replace apostrophes" do
      encoded = "foo's bar".url_encode

      expect(encoded).not_to include "'"
      expect(encoded).to include "%27"
    end
  end

end
