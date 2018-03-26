lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oranchelo_tools/version'

Gem::Specification.new do |spec|
  spec.name          = 'oranchelo_tools'
  spec.version       = OrancheloTools::VERSION
  spec.authors       = ['Miguel Hernández']
  spec.email         = ['mhdez@protonmail.com']

  spec.summary       = 'Development and build tools for Oranchelo Icon Theme'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/Madh93/oranchelo_tools'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = 'oranchelo_tools'
  spec.require_paths = ['lib']

  # Target Ruby version
  spec.required_ruby_version = '>= 2.5.0'

  # Runtime dependencies
  spec.add_runtime_dependency 'fpm', '~> 1.9.3'
  spec.add_runtime_dependency 'logging', '~> 2.2.2'

  # Development dependencies
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'coveralls', '~> 0.8.21'
  spec.add_development_dependency 'guard-rspec', '~> 4.7.3'
  spec.add_development_dependency 'rake', '~> 12.3.0'
  spec.add_development_dependency 'rubocop', '~> 0.53.0'
  spec.add_development_dependency 'yard', '~> 0.9.12'
end
