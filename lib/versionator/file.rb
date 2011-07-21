module Versionator
  module File
    def write(version="0.0.0")
      ::File.open(Versionator.version_file, 'w') {|f| f.write(version) }
    end
    
    def read
      IO.read(Versionator.version_file) rescue nil
    end
  end
end