VERSION_FILE = "#{Rails.root}/VERSION"

namespace :versionator do
  desc "patch version"
  task :patch => :environment do
    versionator = Versionatorator.new
    versionator.release(:patch)
  end

  desc "minor version"
  task :minor => :environment do
    versionator = Versionator.new
    versionator.release(:minor)
  end

  desc "major version"
  task :major => :environment do
    versionator = Versionator.new
    versionator.release(:major)
  end
end
