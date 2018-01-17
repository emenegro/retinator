module Utils
  class << self
    def filename(path)
      extension = File.extname path
      return File.basename path, extension
    end 
  end
end