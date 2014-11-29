require "spec_helper"

describe Lyriki::Legacy::SongData do

  subject { Lyriki::Legacy::SongData.new artist: "fz", song: "inca roads" }

  it { is_expected.to be_truthy }

  describe "#response_data" do
    it { is_expected.to respond_to :response_data }
    it "returns data"
  end

  describe "initialize" do
    describe "missing artist" do
      it "should throw" do
        expect { Lyriki::Legacy::SongData.new song: "inca roads" }.to raise_error(ArgumentError)
      end
    end
    describe "missing song" do
      it "should throw" do
        expect { Lyriki::Legacy::SongData.new artist: "fz" }.to raise_error(ArgumentError)
      end
    end
  end

end
