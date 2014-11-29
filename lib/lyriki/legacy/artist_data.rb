module Lyriki
  module Legacy
    class ArtistData

      def initialize(name)
        @name = name
      end

      def response_data
        {
          "name" => @name
        }
      end

    end
  end
end
