require "json"
require "web_helpers"

module Lyriki
  module Legacy
    class ArtistData

      include WebHelpers

      def initialize(name)
        @data = fetch_data(name)
      end

      def response_data
        JSON.parse @data
      end

      private

      def fetch_data(name)
        Net::HTTP.get(URI(url_for_artist(name)))
      end

      def url_for_artist(name)
        "http://lyrics.wikia.com/api.php?func=getArtist&artist=#{url_encode(name)}&fmt=realjson"
      end

    end
  end
end
