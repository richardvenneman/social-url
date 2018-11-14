# frozen_string_literal: true

module SocialUrl
  module Networks
    class Google
      PARAMS = [:url]

      def initialize(options)
        @params = SocialUrl.filtered_params(options, PARAMS)
      end

      def url
        "https://plus.google.com/share?#{@params}"
      end
    end
  end
end
