require 'erb'
require 'social_url/version'
require 'social_url/message'
require 'social_url/facebook'
require 'social_url/google'
require 'social_url/twitter'

module SocialUrl
  include ERB::Util

  class << self
    NETWORKS = [:facebook, :google, :twitter]

    def networks
      NETWORKS
    end

    def normalize(options)
      opts = {}

      options.each do |key, value|
        next unless value

        opts[key] = normalize_string(value) if value.is_a?(String)
        opts[key] = normalize_array(value) if value.is_a?(Array)
      end

      opts
    end

    def normalize_string(string)
      ERB::Util.url_encode(string)
    end

    def normalize_array(array)
      array.collect do |value|
        ERB::Util.url_encode(value)
      end.join(',')
    end
  end

  class UnsupportedNetworkError < StandardError; end
end
