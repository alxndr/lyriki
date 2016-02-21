require "spec_helper"

describe Lyriki::Legacy::SongLyrics, vcr: { record: :none } do

  subject { Lyriki::Legacy::SongLyrics.new artist: "frank zappa", song: "inca roads" }

  it { is_expected.to be_truthy }

  describe "#response_data" do
    it "returns data" do
      data = subject.response_data
      trimmed_data = data.map(&:strip)

      expect(trimmed_data).to include "Did a vehicle"
      expect(trimmed_data).to include "Come from somewhere out there"
      expect(trimmed_data).to include "That's Ruth"
    end
  end

  describe "initialize" do
    describe "without an artist" do
      it "should raise an error" do
        expect { Lyriki::Legacy::SongLyrics.new song: "inca roads" }.to raise_error(ArgumentError)
      end
    end
    describe "without a song" do
      it "should raise an error" do
        expect { Lyriki::Legacy::SongLyrics.new artist: "fz" }.to raise_error(ArgumentError)
      end
    end
  end

end
