require "spec_helper"

describe Lyriki::Legacy::SongLyrics do

  subject { Lyriki::Legacy::SongLyrics.new artist: "fz", song: "inca roads" }

  it { is_expected.to be_truthy }

  describe "response_data" do
    it { is_expected.to respond_to :response_data }
    it "returns data"
  end

  describe "initialize" do
    describe "without an artist" do
      it "should raise an error" do
        expect{ Lyriki::Legacy::SongLyrics.new song: "inca roads" }.to raise_error(ArgumentError)
      end
    end
    describe "without a song" do
      it "should raise an error" do
        expect{ Lyriki::Legacy::SongLyrics.new artist: "fz" }.to raise_error(ArgumentError)
      end
    end
  end

end
