require "spec_helper"

describe CustomStringMethods do

  String.instance_eval do
    include CustomStringMethods
  end

  describe "#url_encode" do
    it "should replace troublesome characters" do
      encoded = "foo's bar & baz".url_encode

      expect(encoded).not_to include " "
      expect(encoded).to include "+"
      expect(encoded).not_to include "'"
      expect(encoded).to include "%27"
      expect(encoded).not_to include "&"
      expect(encoded).to include "%26"
    end
  end

end
