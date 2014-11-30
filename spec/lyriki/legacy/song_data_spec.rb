require "spec_helper"

describe Lyriki::Legacy::SongData, vcr: { record: :none } do

  subject { Lyriki::Legacy::SongData.new artist: "frank zappa", song: "inca roads" }

  it { is_expected.to be_truthy }

  describe "#response_data" do
    it "returns stored data" do
      data = subject.response_data

      expect(data).to have_key "artist"
      expect(data["artist"]).to eq "Frank Zappa"
      expect(data).to have_key "song"
      expect(data["song"]).to eq "Inca Roads"
      expect(data).to have_key "lyrics"
      expect(data["lyrics"].split("\n").length).to eq 11
      expect(data).to have_key "url"
      expect(data["url"]).to eq "http://lyrics.wikia.com/Frank_Zappa:Inca_Roads"
    end
  end

  describe "initialize" do
    describe "missing artist" do
      it "should throw" do
        expect { Lyriki::Legacy::SongData.new song: "inca roads" }.to raise_error(ArgumentError)
      end
    end
    describe "missing song" do
      it "should throw" do
        expect { Lyriki::Legacy::SongData.new artist: "frank zappa" }.to raise_error(ArgumentError)
      end
    end
  end

end
