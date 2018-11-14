# frozen_string_literal: true

class SocialUrl::Networks::Pinterest < SocialUrl::Network
  def whitelisted_params
    {
      url: :url,
      text: :description,
      media: :media
    }
  end

  def url
    "https://www.pinterest.com/pin/create/button/?#{params}"
  end
end
