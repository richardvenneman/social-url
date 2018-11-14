# frozen_string_literal: true

require "erb"

require "social_url/errors"
require "social_url/version"
require "social_url/message"
require "social_url/network"

NETWORKS = []
Dir[File.join(__dir__, "social_url", "networks", "*.rb")].each do |file|
  require file
  NETWORKS << /.+\/(.+).rb$/.match(file)[1].to_sym
end

module SocialUrl
  include ERB::Util

  class << self
    KEYS = {
      u: :url,
      url: :u,
      description: :text,
      text: :description
    }

    def networks
      NETWORKS
    end

    def normalize(options)
      opts = {}

      options.each do |key, value|
        next unless value

        if key == :hashtags
          opts[key] = normalize_hashtags(value)
        elsif value.is_a?(String)
          opts[key] = normalize_string(value)
        elsif value.is_a?(Array)
          opts[key] = normalize_array(value)
        end
      end

      normalize_keys(opts)
    end

    def normalize_keys(options)
      opts = options.dup

      options.each do |key, value|
        opts[KEYS[key]] = opts[key] if KEYS[key]
      end

      opts
    end

    def normalize_hashtags(array)
      array.collect do |value|
        value.delete(" ")
      end.join(",")
    end

    def normalize_string(string)
      ERB::Util.url_encode(string)
    end

    def normalize_array(array)
      array.collect do |value|
        ERB::Util.url_encode(value)
      end.join(",")
    end

    def filtered_params(options, params)
      params.collect do |param|
        next unless options[param]
        "#{param}=#{options[param]}"
      end.compact.join("&")
    end
  end
end
