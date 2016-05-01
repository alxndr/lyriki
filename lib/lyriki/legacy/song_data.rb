require "json"
require "web_helpers"

module Lyriki
  module Legacy
    class SongData

      include WebHelpers

      def initialize(**args)
        raise ArgumentError unless args[:artist] && args[:song]
        @data = get(url_for_song(args[:artist], args[:song]))
        if response_data["lyrics"] == "Not found"
          raise NoLyricsError, "lyrics not found: #{response_data}"
        end
      end

      def response_data
        JSON.parse @data
      end

      private

      def url_for_song(artist, song)
        "http://lyrics.wikia.com/api.php?artist=#{artist.url_encode}&action=lyrics&song=#{song.url_encode}&fmt=realjson"
      end

    end
  end
end

class NoLyricsError < StandardError; end
