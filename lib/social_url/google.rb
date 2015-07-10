module SocialUrl
  class Google
    def initialize(options)
      @options = options
    end

    def url
      params = "url=#{@options[:url]}"

      "https://plus.google.com/share?#{params}"
    end
  end
end
