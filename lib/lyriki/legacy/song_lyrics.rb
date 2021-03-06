require "json"
require "nokogiri"
require "web_helpers"

module Lyriki
  module Legacy
    class SongLyrics

      include WebHelpers

      def initialize(**args)
        raise ArgumentError unless args[:artist] && args[:song]
        song_data = SongData.new(args).response_data
        if song_data["lyrics"] == "Not found"
          raise NoLyricsError, "lyrics not found: #{song_data}"
        end

        @data = get(song_data["url"])
      end

      def response_data
        Nokogiri::HTML(@data).css("div.lyricbox/text()").map(&:text)
      end

    end
  end
end
