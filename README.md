# social_url

A simple gem to generate social media sharing links.
Supports multiple platforms with a plugin architecture.

## Introduction

This gem was created to help quickly set up sharing links for web pages. This should help you create simple and fast sharing links to social media networks as opposed to performance-heavy third-party sharing widgets.

Read more about (https://jonsuh.com/blog/social-share-links/)[Responsible Social Share Links].

## Installation

Add it to your Gemfile with:

```ruby
gem 'social_url'
```

Run the `bundle install` in your terminal command to install it.

## Usage

The gem exposes two classes `SocialUrl` and `SocialUrl::Message`. The `SocialUrl` class provides normalization functionality for URL parameters and exposes the available networks:

```ruby
SocialUrl.networks #=> [:twitter]

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

message.twitter_url #=> 'https://twitter.com/intent/tweet/?text=Hello%20World&url=http%3A%2F%2Fexample.com&hashtags=nature,sunset'
```

### Available networks

- Twitter

## TODO

This gem is a work-in-progress. Planned features:

- Ruby on Rails ActionView helpers

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- Report bugs
- Fix bugs and submit pull requests
- Write, clarify, or fix documentation
- Suggest or add new features
- Write missing tests
