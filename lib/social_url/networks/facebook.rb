# frozen_string_literal: true

module SocialUrl
  module Networks
    class Facebook < Network
      def params
        [:u]
      end

      def url
        "https://www.facebook.com/sharer/sharer.php?#{@params}"
      end
    end
  end
end
