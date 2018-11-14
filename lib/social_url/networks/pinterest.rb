# frozen_string_literal: true

class SocialUrl::Networks::Pinterest < SocialUrl::Network
  def params
    [:url, :media, :description]
  end

  def url
    "https://www.pinterest.com/pin/create/button/?#{@params}"
  end
end
