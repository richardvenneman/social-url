# frozen_string_literal: true

module SocialUrl
  class Message
    def initialize(options)
      @options = SocialUrl.normalize(options)

      init_networks
    end

    def method_missing(method)
      network = /(.+)_url/.match(method)
      return unless network

      networks = SocialUrl.networks.join(",")
      raise UnsupportedNetworkError,
           "Unsupported network '#{network[1]}'. Choose from: #{networks}."
    end

    private
      def init_networks
        SocialUrl.networks.each do |network|
          self.class.send(:define_method, "#{network}_url") do
            klass = network.to_s.capitalize
            SocialUrl::Networks.const_get(klass).new(@options).url
          end
        end
      end
  end
end
