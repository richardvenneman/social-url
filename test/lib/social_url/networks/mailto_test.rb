# frozen_string_literal: true

require "test_helper"

class SocialUrl::Networks::MailtoTest < Minitest::Test
  def setup
    @params = {
      text: "Hello World",
      url: "http://example.com"
    }
  end

  def test_url
    params = SocialUrl.normalize(@params)
    url = "mailto:?body=http%3A%2F%2Fexample.com&subject=Hello%20World"

    assert_equal url, SocialUrl::Networks::Mailto.new(params).url
  end
end
