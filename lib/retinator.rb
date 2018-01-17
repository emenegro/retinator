require "colorize"
require_relative "retinator/version"
require_relative "retinator/cli"
require_relative "retinator/resizer"

module Retinator
  Cli.show_help_if_needed(ARGV)
  path = Cli.get_image_path(ARGV)
  res = Cli.get_destination_resolution(ARGV)
  Resizer.generate(path, res)
end
