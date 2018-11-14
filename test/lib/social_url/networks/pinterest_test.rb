# frozen_string_literal: true

require "test_helper"

class SocialUrl::Networks::PinterestTest < Minitest::Test
  def setup
    @params = {
      url: "http://www.flickr.com/photos/kentbrew/6851755809/",
      text: "Next stop: Pinterest",
      media: "http://farm8.staticflickr.com/7027/6851755809_df5b2051c9_z.jpg"
    }
  end

  def test_url
    params = SocialUrl.normalize(@params)
    url = ["https://www.pinterest.com/pin/create/button/",
            "?url=http%3A%2F%2Fwww.flickr.com%2Fphotos%2Fkentbrew%2F6851755809%2F",
            "&description=Next%20stop%3A%20Pinterest",
            "&media=http%3A%2F%2Ffarm8.staticflickr.com%2F7027%2F6851755809_df5b2051c9_z.jpg"].join

    assert_equal url, SocialUrl::Networks::Pinterest.new(params).url
  end
end
