require "mkv2m4v/version"
require "mkv2m4v/mediainfo"
require "trollop"

module Mkv2m4v
  class Command
    def initialize
      parse_options
    end

    def run
      if @options[:info]
        print_info
      else
        convert_files
      end
    end

    private

    def convert_files
      $stderr.puts "Converting files is not yet supported. For now, try the --info option."
      # each_mediainfo do |info|
      # end
    end

    def print_info
      each_mediainfo do |info|
        puts "#{info.general.format}: #{info.filename}"
        info.video.count.times do |i|
          print_video_track(info.video[i])
        end
        info.audio.count.times do |i|
          print_audio_track(info.audio[i])
        end
        puts
      end
    end

    def print_video_track(video)
      puts "Video Track #{video.stream_id}:"
      puts "  Format: #{video.format} (#{video.format_info}, #{video.codec_id})"
      puts "  Resolution: #{video.frame_size}#{video.interlaced? ? "i" : "p"}"
      puts "  FPS: #{video.fps}"
      puts "  Language: #{video.language}"
    end

    def print_audio_track(audio)
      puts "Audio Track #{audio.stream_id}:"
      puts "  Format: #{audio.format} (#{audio.format_info}, #{audio.codec_id})"
      puts "  Channels: #{audio.channel_count} (#{audio.channel_positions})"
      puts "  Language: #{audio.language}"
    end

    def each_mediainfo
      @files.each do |file|
        if File.exists?(file)
          yield Mediainfo.new(file)
        else
          $stderr.puts "#{file} does not exist."
        end
      end
    end

    def parse_options
      usage = usage
      @options = Trollop::options do
        version Mkv2m4v::VersionDescription
        banner [Mkv2m4v::Description, Mkv2m4v::Usage].join("\n")
        opt :info, "Print media info only"
      end
      @files = ARGV
    end
  end
end
