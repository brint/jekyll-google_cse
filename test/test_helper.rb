$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV['CI']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'jekyll-google_cse'

require 'minitest/autorun'
