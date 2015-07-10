require 'test_helper'

module SocialUrl
  class FacebookTest < Minitest::Test
    def setup
      @options = { url: 'http://example.com' }
    end

    def test_url
      url = 'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fexample.com'

      opts = SocialUrl.normalize(@options)
      assert_equal url, Facebook.new(opts).url
    end
  end
end
