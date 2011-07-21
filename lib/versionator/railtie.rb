require 'rails'
require 'versionator'

module Versionator
  class Railtie < Rails::Railtie
    initializer "set_module_var" do
      Versionator.version_file = "#{Rails.root}/VERSION"
    end
  end
end