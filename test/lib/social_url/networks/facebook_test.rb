# frozen_string_literal: true

require "test_helper"

class SocialUrl::Networks::FacebookTest < Minitest::Test
  def setup
    @params = { url: "http://example.com" }
  end

  def test_url
    params = SocialUrl.normalize(@params)
    url = "https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fexample.com"

    assert_equal url, SocialUrl::Networks::Facebook.new(params).url
  end
end
