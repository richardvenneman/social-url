# frozen_string_literal: true

class SocialUrl::Networks::Twitter < SocialUrl::Network
  def whitelisted_params
    {
      text: :text,
      url: :url,
      hashtags: :hashtags,
      via: :via,
      related: :related
    }
  end

  def url
    "https://twitter.com/intent/tweet/?#{@params}"
  end
end
