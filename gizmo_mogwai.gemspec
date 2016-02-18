# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gizmo_mogwai/version'

Gem::Specification.new do |spec|
  spec.name          = "gizmo_mogwai"
  spec.version       = GizmoMogwai::VERSION
  spec.authors       = ["jesus lerma sanchez"]
  spec.email         = ["shuyojl@gmail.com"]

  spec.summary       = %q{Gizmo, a tool to create gremlins}
  spec.description   = %q{Gizmo, is a tool to create classes based in one template}
  spec.homepage      = "https://github.com/jesuslerma/gizmo_mogwai"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "rspec-kickstarter"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
