# ✨ social-url

A simple gem to generate social media sharing URLs.

[![Build Status](https://travis-ci.org/richardvenneman/social-url.svg?branch=master)](https://travis-ci.org/richardvenneman/social-url)
[![Gem Version](https://badge.fury.io/rb/social-url.svg)](https://badge.fury.io/rb/social-url)
[![Maintainability](https://api.codeclimate.com/v1/badges/18b840bd059f4e83442c/maintainability)](https://codeclimate.com/github/richardvenneman/social-url/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/18b840bd059f4e83442c/test_coverage)](https://codeclimate.com/github/richardvenneman/social-url/test_coverage)

Supported networks: Google+, Facebook, Pinterest, Twitter and `mailto:`.

## Introduction

This gem was created to help you create social media sharing URLs. Create a message once and make it sharable on multiple networks with each their own specific parameters.

Use this to create fast sharing links as opposed to performance-heavy third-party sharing widgets.

Read more about [Responsible Social Share Links](https://jonsuh.com/blog/social-share-links) (by [@jonsuh](https://github.com/jonsuh)).

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
- `mailto_url`
- `pinterest_url`
- `twitter_url`

```ruby
message.twitter_url #=> 'https://twitter.com/intent/tweet/?text=Hello%20World&url=http%3A%2F%2Fexample.com&hashtags=nature,sunset'
message.facebook_url #=> 'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fexample.com'
...
```

### Parameters

This gem translates the options passed to the `SocialUrl::Message` into the correct parameters for each network. Supported options are:

| Network       | Supported parameters |
| ------------- | -------------------- |
| Facebook      | `url` (String) |
| Google        | `url` (String) |
| mailto        | `url` (String)<br>`text` (String) |
| Pinterest     | `url` (String)<br>`text` (String)<br>`media` (String) |
| Twitter        | `url` (String)<br>`text` (String)<br>`hashtags` (Array of Strings)<br>`via` (String)<br>`related` (Array of Strings) |

### Utilities

The `SocialUrl` class provides normalization functionality for URL parameters and exposes the available networks:

```ruby
SocialUrl.networks #=> [:facebook, :google, :twitter, ...]

SocialUrl.normalize_string('Hello World') #=> 'Hello%20World'
SocialUrl.normalize_array(%w(nature sunset)) #=> 'nature,sunset'
SocialUrl.normalize_array(['twitter:Twitter News', 'twitterapi:Twitter API News']) #=> 'twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News'
```

## Installation

This library is test with the following Rubies: 2.3.8, 2.4.5, 2.5.3.

Add this line to your application's Gemfile:

```ruby
gem 'social-url'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install social-url

## Contributing

I'm happy to accept any pull requests for new networks. Adding a new network is relatively easy. Say you'd want to add `mynetwork` support:

1. Create `lib/social_url/networks/mynetwork.rb` and `test/lib/social_url/networks/mynetwork_test.rb`
2. Add tests and implementation (take a look at the current networks)

## License

This library is released under the [MIT License](http://www.opensource.org/licenses/MIT).
