require 'simplecov'
SimpleCov.start do
  add_group 'Libraries', 'lib'
end

# Source files
require './lib/social_url'

# Framework
require 'minitest/autorun'
