# frozen_string_literal: true

require "test_helper"

class SocialUrlTest < Minitest::Test
  def test_exposes_available_networks
    assert_kind_of Array, SocialUrl.networks
    assert_includes SocialUrl.networks, :twitter
  end

  def test_string_normalization
    text = "Hello%20World"

    assert_equal text, SocialUrl.normalize_string("Hello World")
  end

  def test_array_normalization
    array = %w(nature sunset)
    text = "nature,sunset"
    complex_array = ["twitter:Twitter News", "twitterapi:Twitter API News"]
    complex_text = "twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News"

    assert_equal text, SocialUrl.normalize_array(array)
    assert_equal complex_text, SocialUrl.normalize_array(complex_array)
  end

  def test_hashtag_normalization
    array = ["Multi Word HashTag", "nature"]
    text = "MultiWordHashTag,nature"

    assert_equal text, SocialUrl.normalize_hashtags(array)
  end
end
