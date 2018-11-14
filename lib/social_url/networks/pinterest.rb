# frozen_string_literal: true

module SocialUrl
  module Networks
    class Pinterest < Network
      def params
        [:url, :media, :description]
      end

      def url
        "https://www.pinterest.com/pin/create/button/?#{@params}"
      end
    end
  end
end
