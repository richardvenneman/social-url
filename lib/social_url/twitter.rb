module SocialUrl
  class Twitter
    PARAMS = [:text, :url, :hashtags, :via, :related]

    def initialize(options)
      @params = SocialUrl.filtered_params(options, PARAMS)
    end

    def url
      "https://twitter.com/intent/tweet/?#{@params}"
    end
  end
end
