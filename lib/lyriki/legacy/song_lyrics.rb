module Lyriki
  module Legacy
    class SongLyrics

      def initialize(**args)
        raise ArgumentError unless args[:artist] && args[:song]
      end

      def response_data
      end

    end
  end
end
