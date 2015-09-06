# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color_toolbox/version'

Gem::Specification.new do |spec|
  spec.name          = "color_toolbox"
  spec.version       = ColorToolbox::VERSION
  spec.authors       = ["Ale Paredes"]
  spec.email         = ["aept7714@gmail.com"]

  spec.summary       = %q{Easily manage color operations}
  spec.description   = %q{From an array of HEX or RGB colors get simply a gradient in the range of positions defined}
  spec.homepage      = "https://github.com/ale7714/color_toolbox/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
