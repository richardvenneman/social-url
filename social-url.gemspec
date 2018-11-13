require './lib/social_url/version'

Gem::Specification.new do |s|
  s.name         = 'social-url'
  s.version      = SocialUrl::VERSION
  s.authors      = ["Richard Venneman"]
  s.email        = 'richardvenneman@me.com'
  s.homepage     = 'https://github.com/richardvenneman/social-url'
  s.summary      = 'Generates social media sharing links'
  s.description  = 'A simple gem to generate social sharing links for your
                   messages. Supports multiple social platforms trough a plugin
                   architecture.'

  s.license      = 'MIT'
  s.require_path = 'lib'
  s.files        = `git ls-files`.split("\n")
  s.test_files   = Dir['test/**/*']

  s.add_development_dependency 'rake', '~> 12'
  s.add_development_dependency 'guard', '~> 2.14'
  s.add_development_dependency 'guard-minitest', '~> 2.4'
  s.add_development_dependency 'simplecov', '~> 0.16'
end
