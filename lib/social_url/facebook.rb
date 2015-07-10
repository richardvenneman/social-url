module SocialUrl
  class Facebook
    def initialize(options)
      @options = options
    end

    def url
      params = "u=#{@options[:url]}"

      "https://www.facebook.com/sharer/sharer.php?#{params}"
    end
  end
end
