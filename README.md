# social-url

A simple gem to generate social media sharing links.

[![Gem Version](https://badge.fury.io/rb/social-url.svg)](http://badge.fury.io/rb/social-url) [![Code Climate](https://codeclimate.com/github/richardvenneman/social-url/badges/gpa.svg)](https://codeclimate.com/github/richardvenneman/social-url) [![Dependency Status](https://gemnasium.com/richardvenneman/social-url.svg)](https://gemnasium.com/richardvenneman/social-url) [![Test Coverage](https://codeclimate.com/github/richardvenneman/social-url/badges/coverage.svg)](https://codeclimate.com/github/richardvenneman/social-url/coverage) [![Build Status](http://img.shields.io/travis/richardvenneman/social-url.svg)](https://travis-ci.org/richardvenneman/social-url)

Supported networks: Google+, Facebook, Pinterest, Twitter.

## Introduction

This gem was created to help quickly set up sharing links for web pages. This should help you create simple and fast sharing links to social media networks as opposed to performance-heavy third-party sharing widgets.

Read more about [Responsible Social Share Links](https://jonsuh.com/blog/social-share-links) (by [@jonsuh](https://github.com/jonsuh)).

## Installation

Add it to your Gemfile with:

```ruby
gem 'social_url'
```

Run the `bundle install` in your terminal command to install it.

## Usage

The gem exposes two classes `SocialUrl` and `SocialUrl::Message`. The `SocialUrl` class provides normalization functionality for URL parameters and exposes the available networks:

```ruby
SocialUrl.networks #=> [:facebook, :google, :twitter, ...]

SocialUrl.normalize_string('Hello World') #=> 'Hello%20World'
SocialUrl.normalize_array(%w(nature sunset)) #=> 'nature,sunset'
SocialUrl.normalize_array(['twitter:Twitter News', 'twitterapi:Twitter API News']) #=> 'twitter%3ATwitter%20News,twitterapi%3ATwitter%20API%20News'
```

Setup a new message to share on social networks using the `Message` class:

```ruby
message = SocialUrl::Message.new({
  text: 'Hello World',
  url: 'http://example.com',
  hashtags: %w(nature sunset)
})

# Use the network methods to easily get sharing URLs

message.twitter_url #=> 'https://twitter.com/intent/tweet/?text=Hello%20World&url=http%3A%2F%2Fexample.com&hashtags=nature,sunset'
message.facebook_url #=> 'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fexample.com'
...
```

## TODO

This gem is a work-in-progress. Planned features:

- Raise on missing required network parameters
- Ruby on Rails ActionView helpers
- Add missing networks

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- Report bugs
- Fix bugs and submit pull requests
- Write, clarify, or fix documentation
- Suggest or add new features
- Write missing tests
