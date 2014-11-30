require "json"
require "nokogiri"

module Lyriki
  module Legacy
    class SongLyrics

      def initialize(**args)
        raise ArgumentError unless args[:artist] && args[:song]
        song_data = SongData.new(args).response_data
        @data = Net::HTTP.get(URI(song_data['url']))
      end

      def response_data
        Nokogiri::HTML(@data).css('div.lyricbox/text()').map(&:text)
      end

    end
  end
end
