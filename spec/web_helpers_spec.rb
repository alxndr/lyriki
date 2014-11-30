require "spec_helper"
require "web_helpers"

describe WebHelpers do

  subject { Class.new { include WebHelpers }.new }

  describe "#get" do
    it { is_expected.to respond_to :get }
    it "should hit Net::HTTP"
    it "should use URI"
  end

end
