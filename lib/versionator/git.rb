module Versionator
  module Git
    def git_checkout
      git_command("git checkout master")
    end

    def git_pull
      git_command("git pull origin master")
    end

    def git_tag
      git_command("git tag v#{version_name}")
    end

    def git_commit(message=nil)
      message = "tag new release v#{version_name}" if message.blank?
      git_command("git commit -a -m '#{message}'")
    end
    
    def git_push
      git_command("git push origin master --tags")
    end
    
    def git_command(str)
      systemu(str).drop(1).join(" ")
    end
  end
end