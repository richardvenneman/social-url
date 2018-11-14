# frozen_string_literal: true

module SocialUrl
  module Networks
  end

  class Network
    def initialize(params)
      @params = normalized_params(params)
    end

    def whitelisted_params
      raise SocialUrl::NotImplementedError, "#{self.class.name} should implement #whitelisted_params"
    end

    def url
      raise SocialUrl::NotImplementedError, "#{self.class.name} should implement #url"
    end

    private
      def normalized_params(params)
        whitelisted_params.map do |key, value|
          value.to_s << "=" << params[key]
        end.join("&")
      end
  end
end
