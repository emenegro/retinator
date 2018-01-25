require "mini_magick"
require "colorize"
require "fileutils"
require_relative "retinator/version"
require_relative "retinator/config"
require_relative "retinator/utils"

module Retinator
  class << self
    def generate(path, res)
      return false unless path && res
      show_dimension_hint_if_needed path, res
      generate_images path, res
      return true
    end

    def remove_files_on_abort
      @saved_files.each do |file|
        FileUtils.rm file
      end
      @saved_files.clear
    end

    private def generate_images(path, res)
      @saved_files = []
      name = Utils.filename path
      OUTPUTS.each do |config|
        scale = config[0]
        suffix = config[1]
        filename = "#{name}#{suffix}.#{OUTPUT_FORMAT}"
        puts "Generating #{filename}..."
        image = resize path, res * scale
        save_file image, filename, OUTPUT_FORMAT
      end
      puts "Done!".green
      @saved_files.clear
    end

    private def show_dimension_hint_if_needed(path, res)
      image = MiniMagick::Image.open(path)
      smaller_dimensions = image.dimensions.select { |d| d <= res * OUTPUT_MAX_SCALE}
      if !smaller_dimensions.empty?
        puts "[!] Size of the source image is smaller than the destination resolution".yellow
        puts "    Result images could be pixelated".yellow
      end
    end

    private def resize(path, res)
      image = MiniMagick::Image.open path
      return image.resize("#{res}x#{res}^")
    end

    private def save_file(image, filename, format)
      image.format format
      image.write filename
      @saved_files << filename
    end
  end
end
