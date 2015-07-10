require 'test_helper'

module SocialUrl
  class PinterestTest < Minitest::Test
    def setup
      @options = {
        url: 'http://www.flickr.com/photos/kentbrew/6851755809/',
        media: 'http://farm8.staticflickr.com/7027/6851755809_df5b2051c9_z.jpg',
        description: 'Next stop: Pinterest'
      }
    end

    def test_url
      opts = SocialUrl.normalize(@options)
      url = ['https://www.pinterest.com/pin/create/button/',
              '?url=http%3A%2F%2Fwww.flickr.com%2Fphotos%2Fkentbrew%2F6851755809%2F',
              '&media=http%3A%2F%2Ffarm8.staticflickr.com%2F7027%2F6851755809_df5b2051c9_z.jpg',
              '&description=Next%20stop%3A%20Pinterest'].join

      assert_equal url, Pinterest.new(opts).url
    end
  end
end
