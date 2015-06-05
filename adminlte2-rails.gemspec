lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adminlte2/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "adminlte2-rails"
  spec.version       = AdminLTE2::Rails::VERSION
  spec.authors       = ["Nicolas Besnard"]
  spec.email         = ["besnard.nicolas@gmail.com"]
  spec.homepage         = 'https://github.com/nicolas-besnard/adminlte2-rails'
  spec.summary          = %q{Integrates the AdminLTE theme with the Rails asset pipeline}
  spec.description      = %q{AdminLTE is a premium Bootstrap theme for Backend.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bootstrap-sass", "~> 3.3.4.1"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
