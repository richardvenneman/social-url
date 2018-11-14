# frozen_string_literal: true

require "test_helper"

class SocialUrl::Networks::GoogleTest < Minitest::Test
  def setup
    @options = {
      text: "Hello World",
      url: "http://example.com"
    }
  end

  def test_url
    opts = SocialUrl.normalize(@options)
    url = "https://plus.google.com/share?url=http%3A%2F%2Fexample.com"

    assert_equal url, SocialUrl::Networks::Google.new(opts).url
  end
end
