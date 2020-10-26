# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lagunitas/version'

Gem::Specification.new do |spec|
  spec.name          = 'lagunitas'
  spec.version       = Lagunitas::VERSION
  spec.authors       = ['Sam Soffes']
  spec.email         = ['sam@soff.es']
  spec.description   = 'Easy iOS IPAs inspection.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/soffes/lagunitas'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.4'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 1.3'

  spec.add_dependency 'CFPropertyList'
  spec.add_dependency 'pngdefry', '>= 0.1.0'
  spec.add_dependency 'rubyzip', '>= 1.0.0'

  spec.add_development_dependency 'minitest', '>= 5.0'
  spec.add_development_dependency 'rake'
end
