# frozen_string_literal: true

require "test_helper"

class SocialUrl::NetworkTest < Minitest::Test
  def setup
    @network = SocialUrl::Network.new(
      text: "Hello World",
      url: "http://example.com"
    )
  end

  def test_url_raises
    assert_raises SocialUrl::NotImplementedError do
      @network.url
    end
  end

  def test_whitelisted_params_raises
    assert_raises SocialUrl::NotImplementedError do
      @network.whitelisted_params
    end
  end
end
