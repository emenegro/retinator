require "colorize"
require_relative "retinator/version"
require_relative "retinator/cli"
require_relative "retinator/resizer"

module Retinator
  if !Cli.show_help_if_needed(ARGV)
    path = Cli.get_image_path(ARGV)
    res = Cli.get_destination_resolution(ARGV)
    unless path && res
      exit(1)
    end
    Resizer.generate(path, res)
  end
end
