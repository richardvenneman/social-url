# frozen_string_literal: true

class SocialUrl::Networks::Twitter < SocialUrl::Network
  def params
    [:text, :url, :hashtags, :via, :related]
  end

  def url
    "https://twitter.com/intent/tweet/?#{@params}"
  end
end
