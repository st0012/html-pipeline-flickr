# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'html/pipeline/flickr/version'

Gem::Specification.new do |spec|
  spec.name          = "html-pipeline-flickr"
  spec.version       = HTML::Pipeline::Flickr::VERSION
  spec.authors       = ["Stan Luo"]
  spec.email         = ["stan001212@gmail.com"]

  spec.summary       = %q{Flickr filter for html-pipeline}
  spec.description   = %q{A html-pipeline filter that converts flickr url into a linkable image}
  spec.homepage      = "https://github.com/st0012/html-pipeline-flickr"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "html-pipeline", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
