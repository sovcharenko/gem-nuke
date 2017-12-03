require File.expand_path('../lib/gem_nuke/version.rb', __FILE__)

Gem::Specification.new do |spec|
  spec.name = 'gem-nuke'
  spec.version = GemNuke::VERSION
  spec.authors = ['Sergii Ovcharenko']
  spec.email = 'developer@sovcharenko.com'
  spec.homepage = 'https://github.com/sovcharenko/gem-nuke'
  spec.summary = 'Gem command to remove all installed gems.'
  spec.license = 'MIT'
  spec.files = Dir['lib/**/*'] + %w[README.md LICENSE]
  spec.test_files = []

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'
end
