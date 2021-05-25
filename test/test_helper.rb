$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV['CI']
  require 'simplecov'
  SimpleCov.start
end

require 'jekyll-google_cse'

require 'minitest/autorun'
