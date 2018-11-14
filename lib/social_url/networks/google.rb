# frozen_string_literal: true

module SocialUrl
  module Networks
    class Google < Network
      def params
        [:url]
      end

      def url
        "https://plus.google.com/share?#{@params}"
      end
    end
  end
end
