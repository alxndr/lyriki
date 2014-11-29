require "spec_helper"

describe Lyriki::Legacy::ArtistData do

  subject { Lyriki::Legacy::ArtistData.new "fz" }

  it { is_expected.to be_truthy }

  describe "#response_data" do
    fake_data = {response: "data"}

    it "should return stored data" do
      expect(subject.response_data["name"]).to eq "fz"
    end
  end

  describe "initialize without a name" do
    it "should raise an error" do
      expect{ Lyriki::Legacy::ArtistData.new }.to raise_error(ArgumentError)
    end
  end

end
