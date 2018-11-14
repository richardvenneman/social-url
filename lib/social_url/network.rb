# frozen_string_literal: true

module SocialUrl
  module Networks
  end

  class Network
    def initialize(options)
      @params = normalized_params(options)
    end

    def params
      raise SocialUrl::NotImplementedError, "#{self.class.name} should implement #params"
    end

    def url
      raise SocialUrl::NotImplementedError, "#{self.class.name} should implement #url"
    end

    private
      def normalized_params(options)
        params.map do |key, value|
          value.to_s << "=" << options[key]
        end.join("&")
      end
  end
end
