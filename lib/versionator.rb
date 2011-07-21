require 'versionator/railtie'
require 'versionator/git'
require 'versionator/file'
require 'versionator/version'
require 'systemu'

module Versionator
  mattr_accessor :version_file
end