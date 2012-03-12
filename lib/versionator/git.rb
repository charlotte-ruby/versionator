module Versionator
  module Git
    def git_current_branch
      git_command("git branch").split(/\n/).grep(/\*/).first.gsub('* ', '')
    end

    def git_checkout(branch = 'master')
      git_command("git checkout #{branch}")
    end

    def git_pull(branch = 'master')
      git_command("git pull origin #{branch}")
    end

    def git_tag
      git_command("git tag v#{version_name}")
    end

    def git_commit(message = nil)
      message = "tag new release v#{version_name}" if message.blank?
      git_command("git commit -a -m '#{message}'")
    end
    
    def git_push(branch = 'master')
      git_command("git push origin #{branch} --tags")
    end
    
    def git_command(str)
      systemu(str).drop(1).join(" ")
    end
  end
end
