# frozen_string_literal: true

module SocialUrl
  module Networks
  end

  class Network
    def initialize(params)
      @original_params = params
    end

    def params
      whitelisted_params.map do |key, value|
        value.to_s << "=" << @original_params[key]
      end.join("&")
    end

    def whitelisted_params
      raise SocialUrl::NotImplementedError, "#{self.class.name} should implement #whitelisted_params"
    end

    def url
      raise SocialUrl::NotImplementedError, "#{self.class.name} should implement #url"
    end
  end
end
