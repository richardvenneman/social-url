# frozen_string_literal: true

require "test_helper"

module SocialUrl
  class MessageTest < Minitest::Test
    def setup
      @message = Message.new({})
      @complete_message = Message.new(
        text: "Hello World",
        url: "http://example.com",
        hashtags: %w(nature sunset),
        via: "twitterdev",
        related: ["twitter:Twitter News", "twitterapi:Twitter API News"]
      )
    end

    def teardown
      @message.destroy
      @complete_message.destroy
    end

    def test_exposes_network_methods
      SocialUrl.networks.each do |network|
        method = "#{network}_url".to_sym
        assert_respond_to @message, method
      end
    end

    def test_throws_on_invalid_network
      assert_raises UnsupportedNetworkError do
        @message.derp_url
      end
    end

    def test_network_url
      url = ["https://twitter.com/intent/tweet/?text=Hello%20World",
             "&url=http%3A%2F%2Fexample.com",
             "&hashtags=nature,sunset",
             "&via=twitterdev",
             "&related=twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News"].join

      assert_equal url, @complete_message.twitter_url
    end
  end
end
