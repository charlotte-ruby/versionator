namespace :versionator do
  desc "patch version"
  task :patch => :environment do
    versionator = Versionator::Version.new
    output = versionator.release(:patch)
    puts output    
  end

  desc "minor version"
  task :minor => :environment do
    versionator = Versionator::Version.new
    output = versionator.release(:minor)
    puts output    
  end

  desc "major version"
  task :major => :environment do
    versionator = Versionator::Version.new
    output = versionator.release(:major)
    puts output
  end
end
