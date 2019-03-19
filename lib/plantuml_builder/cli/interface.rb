require 'docopt'

module PlantumlBuilder
  module Cli
    class Interface
      DOC =<<DOC
plantuml_build allows to build diagrams with PlantUML

Usage:
  %<name>s (svg|png|txt) <source> <destination> [--endpoint=<endpoint>]
  %<name>s (svg|png|txt) -R <source_dir> <destination_dir> [--endpoint=<endpoint>]
  %<name>s -h | --help
  %<name>s --version


Options:
  -h --help                Show this screen.
  --version                Show version.
  -R                       Recursively build folder.
  --endpoint=<endpoint>    URL of PlantUML endpoint

DOC

      def initialize(filename)
        self.cmd = File.basename(filename)
      end

      def run
        process
      rescue Docopt::Exit => e
        puts e.message
      end

      private

      attr_accessor :cmd

      def documentation
        format(DOC, name: cmd)
      end

      def arguments
        args = Docopt::docopt(documentation)
        PlantumlBuilder::Cli::Args.new(args)
      end

      def process
        PlantumlBuilder::Cli::CliProcessor.new(arguments).process
      end
    end
  end
end
