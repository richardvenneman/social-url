# frozen_string_literal: true

require "test_helper"

class SocialUrl::Networks::GoogleTest < Minitest::Test
  def setup
    @params = {
      text: "Hello World",
      url: "http://example.com"
    }
  end

  def test_url
    params = SocialUrl.normalize(@params)
    url = "https://plus.google.com/share?url=http%3A%2F%2Fexample.com"

    assert_equal url, SocialUrl::Networks::Google.new(params).url
  end
end
