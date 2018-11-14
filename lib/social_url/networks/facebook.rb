# frozen_string_literal: true

class SocialUrl::Networks::Facebook < SocialUrl::Network
  def whitelisted_params
    {
      url: :u
    }
  end

  def url
    "https://www.facebook.com/sharer/sharer.php?#{params}"
  end
end
