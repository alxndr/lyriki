require "json"
require "web_helpers"

module Lyriki
  module Legacy
    class SongData

      include WebHelpers

      def initialize(**args)
        raise ArgumentError unless args[:artist] && args[:song]
        data = JSON.parse(get(url_for_song(args[:artist], args[:song])))
        raise NoLyricsError, "lyrics not found: #{data}" if data["lyrics"] == "Not found"
        @data = data
      end

      def response_data
        @data
      end

      private

      def url_for_song(artist, song)
        "http://lyrics.wikia.com/api.php?artist=#{artist.url_encode}&action=lyrics&song=#{song.url_encode}&fmt=realjson"
      end

    end
  end
end

class NoLyricsError < StandardError; end
