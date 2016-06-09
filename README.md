# social-url

A simple gem to generate social media sharing URLs.

[![Gem](https://img.shields.io/gem/v/social-url.svg?style=flat-square)](http://rubygems.org/gems/social-url)
[![Build Status](https://img.shields.io/travis/richardvenneman/social-url/master.svg?style=flat-square)](https://travis-ci.org/richardvenneman/social-url)
[![Gemnasium](https://img.shields.io/gemnasium/richardvenneman/social-url.svg?style=flat-square)](https://gemnasium.com/richardvenneman/social-url)
[![Code Climate](https://img.shields.io/codeclimate/github/richardvenneman/social-url.svg?style=flat-square)](https://codeclimate.com/github/richardvenneman/social-url)
[![Test Coverage](https://img.shields.io/codeclimate/coverage/github/richardvenneman/social-url.svg?style=flat-square)](https://codeclimate.com/github/richardvenneman/social-url/coverage)

Supported networks: Google+, Facebook, Pinterest, Twitter.

## Introduction

This gem was created to help you create social media sharing URLs. Create a message once and make it sharable on multiple networks with each their own specific parameters.

Use this to create fast sharing links as opposed to performance-heavy third-party sharing widgets.

Read more about [Responsible Social Share Links](https://jonsuh.com/blog/social-share-links) (by [@jonsuh](https://github.com/jonsuh)).

## Installation

This library is test with the following Rubies: 2.3.0, 2.2.4.

Add it to your Gemfile with:

```ruby
gem 'social_url'
```

Run the `bundle install` command in your terminal to install it.

## Usage

Setup a new message to share on social networks using the `Message` class:

```ruby
message = SocialUrl::Message.new({
  text: 'Hello World',
  url: 'http://example.com',
  hashtags: %w(nature sunset)
})
```

Use the message's network methods to get the sharing URLs:

- `facebook_url`
- `google_url`
- `pinterest_url`
- `twitter_url`

```ruby
message.twitter_url #=> 'https://twitter.com/intent/tweet/?text=Hello%20World&url=http%3A%2F%2Fexample.com&hashtags=nature,sunset'
message.facebook_url #=> 'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fexample.com'
...
```

The `SocialUrl` class provides normalization functionality for URL parameters and exposes the available networks:

```ruby
SocialUrl.networks #=> [:facebook, :google, :twitter, ...]

SocialUrl.normalize_string('Hello World') #=> 'Hello%20World'
SocialUrl.normalize_array(%w(nature sunset)) #=> 'nature,sunset'
SocialUrl.normalize_array(['twitter:Twitter News', 'twitterapi:Twitter API News']) #=> 'twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News'
```

## Contributing

I'm happy to accept any pull requests for new networks. Adding a new network is relatively easy. Say you'd want to add `mynetwork` support:

1. Create `lib/social_url/mynetwork.rb` and `test/lib/social_url/mynetwork_test.rb`
2. Add tests and implementation (take a look at the current networks)
3. In `lib/social_url.rb`, add a require statement and add `:mynetwork` to the `NETWORKS` constant

## License

This library is released under the [MIT License](http://www.opensource.org/licenses/MIT).
