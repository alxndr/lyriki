require "spec_helper"

describe Lyriki::Legacy::ArtistData, vcr: { record: :none } do

  subject { Lyriki::Legacy::ArtistData.new "frank zappa" }

  it { is_expected.to be_truthy }

  describe "#response_data" do
    it "should return stored data" do
      data = subject.response_data

      expect(data).to have_key "artist"
      expect(data["artist"]).to eq "Frank Zappa"
      expect(data).to have_key "albums"
      expect(data["albums"].length).to eq 41
      expect(data["albums"].first["album"]).to eq "Lumpy Gravy"
    end
  end

  describe "initialize without a name" do
    it "should raise an error" do
      expect{ Lyriki::Legacy::ArtistData.new }.to raise_error ArgumentError
    end
  end

end
