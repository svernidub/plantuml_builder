require 'plantuml_builder/version'
require 'plantuml_builder/deflate'
require 'plantuml_builder/encode64'
require 'plantuml_builder/compressor'
require 'plantuml_builder/url_builder'
require 'plantuml_builder/diagram_fetcher'
require 'plantuml_builder/format'
require 'plantuml_builder/formats'

if defined?(CLI)
  require 'plantuml_builder/cli/args'
  require 'plantuml_builder/cli/cli_processor'
end

module PlantumlBuilder
end
