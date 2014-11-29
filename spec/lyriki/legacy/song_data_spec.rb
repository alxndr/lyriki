require "spec_helper"

describe Lyriki::Legacy::SongData do

  subject { Lyriki::Legacy::SongData.new artist: "fz", song: "inca roads" }

  it "should exist" do
    expect(subject).to be_truthy
  end

  describe "initialize" do
    describe "missing artist" do
      it "should throw" do
        expect{ Lyriki::Legacy::SongData.new song: "inca roads" }.to raise_error(ArgumentError)
      end
    end
    describe "missing song" do
      it "should throw" do
        expect{ Lyriki::Legacy::SongData.new artist: "fz" }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#response_data" do
    it { is_expected.to respond_to :response_data }
    it "returns data"
  end

end
