module SocialUrl
  class Pinterest
    def initialize(options)
      @options = options
    end

    def url
      params = @options.collect do |key, value|
        "#{key}=#{value}"
      end.join('&')

      "https://www.pinterest.com/pin/create/button/?#{params}"
    end
  end
end
