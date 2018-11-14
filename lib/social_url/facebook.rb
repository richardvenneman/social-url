# frozen_string_literal: true

module SocialUrl
  class Facebook
    PARAMS = [:u]

    def initialize(options)
      @params = SocialUrl.filtered_params(options, PARAMS)
    end

    def url
      "https://www.facebook.com/sharer/sharer.php?#{@params}"
    end
  end
end
