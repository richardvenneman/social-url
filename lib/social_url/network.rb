# frozen_string_literal: true

module SocialUrl
  class Network
    def initialize(options)
      @params = SocialUrl.filtered_params(options, params)
    end

    def params
      raise NotImplementedError, "#{self.class.name} should implement #params"
    end

    def url
      raise NotImplementedError, "#{self.class.name} should implement #url"
    end
  end
end
