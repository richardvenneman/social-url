# frozen_string_literal: true

require "test_helper"

class SocialUrl::Networks::TwitterTest < Minitest::Test
  def setup
    @params = {
      text: "Hello World",
      url: "http://example.com",
      hashtags: ["nature", "sunset", "Multi Word HashTag"],
      via: "twitterdev",
      related: ["twitter:Twitter News", "twitterapi:Twitter API News"]
    }
  end

  def test_url
    params = SocialUrl.normalize(@params)
    url = ["https://twitter.com/intent/tweet/?text=Hello%20World",
           "&url=http%3A%2F%2Fexample.com",
           "&hashtags=nature,sunset,MultiWordHashTag",
           "&via=twitterdev",
           "&related=twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News"].join

    assert_equal url, SocialUrl::Networks::Twitter.new(params).url
  end
end
