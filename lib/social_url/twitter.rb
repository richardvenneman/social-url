module SocialUrl
  class Twitter
    def initialize(options)
      @options = options
    end

    def url
      params = @options.collect do |key, value|
        "#{key}=#{value}"
      end.join('&')

      "https://twitter.com/intent/tweet/?#{params}"
    end
  end
end
