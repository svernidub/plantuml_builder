module PlantumlBuilder
  module Cli
    class CliProcessor
      def initialize(args_object)
        self.args_object = args_object
      end

      def process
        case
        when args_object.version?
          puts_version
        when args_object.recursive?
          process_folder
        else
          process_file(args_object.source, args_object.destination)
        end
      end

      private

      def puts_version
        puts PlantumlBuilder::VERSION
        exit(0)
      end

      def process_folder
        Dir.glob("#{args_object.source_dir}/**/*.*").each do |file|
          r = Regexp.new("^#{args_object.source_dir}")
          dest = file.gsub(r, args_object.destination_dir)

          destdir = File.dirname(dest)
          FileUtils.mkdir_p(destdir)

          dest_file = "#{destdir}/#{File.basename(dest, File.extname(dest))}.#{ext}"

          process_file(file, dest_file)
        end

      rescue Errno::EEXIST => e
        puts e.message
        exit(1)
      end

      def process_file(source, dest)
        uml = File.read(source)
        f = args_object.endpoint.nil? ? [uml] : [uml, args_object.endpoint]

        File.open(dest, 'w') do |file|
          file.write(format.new(*f).load)
        end
      rescue Errno::ENOENT, Errno::EISDIR, SocketError => e
        puts e.message
        exit(1)
      end

      def format
        case
        when args_object.svg?
          PlantumlBuilder::Formats::SVG
        when args_object.png?
          PlantumlBuilder::Formats::PNG
        when args_object.txt?
          PlantumlBuilder::Formats::TXT
        end
      end

      def ext
        case
        when args_object.svg?
          'svg'
        when args_object.png?
          'png'
        when args_object.txt?
          'txt'
        end
      end

      attr_accessor :args_object
    end
  end
end