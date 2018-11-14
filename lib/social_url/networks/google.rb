# frozen_string_literal: true

class SocialUrl::Networks::Google < SocialUrl::Network
  def params
    [:url]
  end

  def url
    "https://plus.google.com/share?#{@params}"
  end
end
