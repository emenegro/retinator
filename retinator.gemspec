lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "retinator/version"

Gem::Specification.new do |spec|
  spec.name          = "retinator"
  spec.version       = Retinator::VERSION
  spec.authors       = ["Mario Negro"]
  spec.email         = ["mario.negro.martin@gmail.com"]
  spec.summary       = "Generates @1x, @2x and @3x images versions of an image"
  spec.description   = "Generates @1x, @2x and @3x images versions of an image for iOS projects"
  spec.homepage      = "https://github.com/emenegro/retinator"
  spec.requirements << 'You must have ImageMagick or GraphicsMagick installed. Try with `brew install imagemagick` on macOS.'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "colorize", "~> 0.8.1"
  spec.add_runtime_dependency "mini_magick", "~> 4.8"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
