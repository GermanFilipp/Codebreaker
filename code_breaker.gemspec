# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'code_breaker/version'

Gem::Specification.new do |spec|
  spec.name          = "code_breaker"
  spec.version       = CodeBreaker::VERSION
  spec.authors       = ["GermanFilipp"]
  spec.email         = ["ger772@yandx.ru"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://github.com/GermanFilipp/Codebreaker.git"
  end

  spec.summary       = %q{The codebreaker game written via TDD and RSpec framework.}
  spec.homepage      = "https://github.com/GermanFilipp/Codebreaker.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fuubar"
end
