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
    def networks
      NETWORKS
    end

    def normalize(params)
      params.reject { |key, value| !value }.map do |key, value|
        if key == :hashtags
          [key, normalize_hashtags(value)]
        elsif value.is_a?(String)
          [key, normalize_string(value)]
        elsif value.is_a?(Array)
          [key, normalize_array(value)]
        end
      end.to_h
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
  end
end
