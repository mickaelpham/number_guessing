# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'number_guessing/version'

Gem::Specification.new do |spec|
  spec.name          = "number_guessing"
  spec.version       = NumberGuessing::VERSION
  spec.authors       = ["Mickael Pham"]
  spec.email         = ["mickael.pham@gmail.com"]

  spec.summary       = %q{Simple number guessing minigame}
  spec.homepage      = "https://github.com/mickaelpham/number_guessing"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
