module Cli
  class << self
    def get_image_path(args)
      path = args[0]
      if !path
        puts "Error, image full path needed".red 
        exit(1)
      elsif !File.exists? path
        puts "Error, no file found at '#{image_path}".red
        exit(1)
      end
      return path
    end

    def get_destination_resolution(args)
      res = args[1].to_i
      if !res
        puts "Error, destination resolution needed in pixels".red 
        exit(1)
      elsif res == 0
        puts "Error, destination resolution has to be a number greater than 0".red 
        exit(1)
      end
      return res
    end

    def show_help_if_needed(args)
      if args.count != 2 || args.include?("--help")
        puts "Retinator resizes the source image and generates"
        puts "three images in @1x, @2x and @3x iOS resolutions"
        puts
        puts "  Usage:"
        puts "    retinator [source_image] [destination_resolution]"
        puts "    retinator --help"
        puts
        puts "  Parameters:"
        puts "    - [source_image]: path to the source image"
        puts "    - [destination_resolution]: a number indicating the minimum resolution"
        puts "      of the smaller dimension of the destination @1x image"
        puts
        puts "  Example:"
        puts "     For an input image of 3000x1500, 'retinator test.jpg 200' will output:"
        puts "       test.png    (400x200)"
        puts "       test@2x.png (800x400)"
        puts "       test@3x.png (1200x600)"
        exit(1)
      end
    end
  end
end