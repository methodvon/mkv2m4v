require "mkv2m4v/version"
require "mkv2m4v/file"
require "trollop"

module Mkv2m4v
  class Command
    def initialize
      parse_options
    end

    def run
      if @options[:info]
        each_file(&:print)
      else
        each_file(&:transcode)
      end
    end

    private

    def each_file
      Mkv2m4v::File.each(@filenames, @options) do |file|
        yield file
      end
    end

    def parse_options
      usage = usage
      @options = Trollop::options do
        version Mkv2m4v::VersionDescription
        banner [Mkv2m4v::Description, Mkv2m4v::Usage].join("\n")
        opt :info, "Print media info only"
        opt :lang, "Preferred languages", :type => :strings, :default => ["English"]
        opt :dir, "Destination directory", :type => :string
        opt :verbose, "More output", :type => :boolean
      end
      @options[:languages] = @options[:lang].map { |lang| Iso639[lang] }.compact
      @filenames = ARGV
    end
  end
end
