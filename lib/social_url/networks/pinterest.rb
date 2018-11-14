# frozen_string_literal: true

module SocialUrl
  module Networks
    class Pinterest
      PARAMS = [:url, :media, :description]

      def initialize(options)
        @params = SocialUrl.filtered_params(options, PARAMS)
      end

      def url
        "https://www.pinterest.com/pin/create/button/?#{@params}"
      end
    end
  end
end
