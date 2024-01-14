# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-google_cse/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-google_cse'
  spec.version       = Jekyll::GoogleCse::VERSION
  spec.authors       = ["Brint O'Hearn"]
  spec.email         = ['brintly@gmail.com']

  spec.summary       = 'Add Google CSE to your Jekyll site'
  spec.homepage      = 'https://github.com/brint/jekyll-google_cse'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r{^(test|spec|features)/})
  }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this
  # section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public pushes.'
  end

  spec.add_dependency 'jekyll', '>= 4.0'

  spec.add_development_dependency 'bundler', '>= 2.2'
  spec.add_development_dependency 'rake', '>= 13.0'
  spec.add_development_dependency 'minitest', '>= 5.0'
  spec.add_development_dependency 'rubocop', '>= 1.15'
end