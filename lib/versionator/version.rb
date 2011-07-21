module Versionator
  class Version
    include Versionator::File
    include Versionator::Git
    attr_accessor :major, :minor, :patch

    def initialize
      version_file_content = read rescue nil
      if version_file_content.nil?
        write
        version_file_content = read
        puts "Versionator file created: #{Versionator.version_file}"
      end
      categories = version_categories(version_file_content)
      @major = categories[0]
      @minor = categories[1]
      @patch = categories[2]
    end

    def version_categories(version_str)
      version_str.split(".").collect{|s|s.to_i}
    end

    def bump(category)
      case category
      when :major
        @major += 1
        @minor = 0
        @patch = 0
      when :minor
        @minor += 1
        @patch = 0
      when :patch
        @patch += 1
      end
    end

    def version_name
      [@major,@minor,@patch].join(".")
    end

    def git_release
      output = git_checkout
      output += git_pull
      output += git_tag
      output += git_commit
      output += git_push
      output
    end

    def release(category)
      bump(category)
      write(version_name)
      git_release
    end
  end
end