require "web_helpers"

module Lyriki
  module Legacy
    class SongData

      include WebHelpers

      def initialize(**args)
        raise ArgumentError unless args[:artist] && args[:song]
        @data = fetch_data(artist: args[:artist], song: args[:song])
      end

      def response_data
        JSON.parse @data
      end

      private

      def fetch_data(artist:, song:)
        Net::HTTP.get(URI(url_for_song(artist, song)))
      end

      def url_for_song(artist, song)
        "http://lyrics.wikia.com/api.php?artist=#{url_encode(artist)}&song=#{url_encode(song)}&fmt=realjson"
      end

    end
  end
end
