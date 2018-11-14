# frozen_string_literal: true

class SocialUrl::Networks::Mailto < SocialUrl::Network
  def whitelisted_params
    {
      url: :body,
      text: :subject
    }
  end

  def url
    "mailto:?#{params}"
  end
end
