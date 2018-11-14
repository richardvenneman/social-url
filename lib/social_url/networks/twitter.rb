# frozen_string_literal: true

module SocialUrl
  module Networks
    class Twitter < Network
      def params
        [:text, :url, :hashtags, :via, :related]
      end

      def url
        "https://twitter.com/intent/tweet/?#{@params}"
      end
    end
  end
end
