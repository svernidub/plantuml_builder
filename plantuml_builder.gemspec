lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'plantuml_builder/version'

Gem::Specification.new do |spec|
  spec.name          = 'plantuml_builder'
  spec.version       = PlantumlBuilder::VERSION
  spec.authors       = ['Sergey Vernidub']
  spec.email         = ['svernidub@gmail.com']

  spec.summary       = 'Gem to build text diagrams with plant uml'
  spec.description   = 'Gem to build text diagrams with plant uml'
  spec.homepage      = 'https://github.com/svernidub/plantuml_builder'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
