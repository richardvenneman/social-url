require 'test_helper'

class SocialUrlTest < Minitest::Test
  def setup
    @options = {
      text: 'Hello World',
      url: 'http://example.com/',
      hashtags: %w(nature sunset),
      via: 'twitterdev',
      related: ['twitter:Twitter News', 'twitterapi:Twitter API News']
    }

    @normalized_options = {
      text: 'Hello%20World',
      description: 'Hello%20World',
      u: 'http%3A%2F%2Fexample.com%2F',
      url: 'http%3A%2F%2Fexample.com%2F',
      hashtags: 'nature,sunset',
      via: 'twitterdev',
      related: 'twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News'
    }
  end

  def test_exposes_available_networks
    assert_kind_of Array, SocialUrl.networks
    assert_includes SocialUrl.networks, :twitter
  end

  def test_string_normalization
    text = 'Hello%20World'

    assert_equal text, SocialUrl.normalize_string('Hello World')
  end

  def test_array_normalization
    array = %w(nature sunset)
    text = 'nature,sunset'
    complex_array = ['twitter:Twitter News', 'twitterapi:Twitter API News']
    complex_text = 'twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News'

    assert_equal text, SocialUrl.normalize_array(array)
    assert_equal complex_text, SocialUrl.normalize_array(complex_array)
  end

  def test_hashtag_normalization
    array = ['Multi Word HashTag', 'nature']
    text = 'MultiWordHashTag,nature'

    assert_equal text, SocialUrl.normalize_hashtags(array)
  end

  def test_normalization
    assert_equal @normalized_options, SocialUrl.normalize(@options)
  end

  def test_filtered_params
    filtered_params = 'text=Hello%20World&url=http%3A%2F%2Fexample.com%2F'
    params = [:text, :url, :derp]

    assert_equal filtered_params, SocialUrl.filtered_params(@normalized_options, params)
  end
end
