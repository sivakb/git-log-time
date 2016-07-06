require 'fileutils'

module GitLogTime

  class Installer

    TARGET_GIT_PATH = '.git'
    TARGET_HOOKS_PATH = 'hooks/'
    TEMPLATE_DIR = File.expand_path("../../../templates/hooks/", __FILE__)

    attr_reader :key

    def initialize(key = nil)
      @key = key || "default"
    end

    def hook
      templates[key.sub(/^--/, "")]
    end

    def target
      target_git_path =
      if   File.directory?(TARGET_GIT_PATH)
      then TARGET_GIT_PATH
      else File.readlines('.git').first.match(/gitdir: (.*)$/)[1]
      end
      File.join(target_git_path, (TARGET_HOOKS_PATH + key))
    end

    def install
      if
        hook
      then
        FileUtils.cp(target, target+ ".backup")
        FileUtils.mkdir_p(File.dirname(target))
        FileUtils.cp(hook, target)
        FileUtils.chmod(0755, target)
        puts "Installed #{hook} to #{target}"
        true
      else
        warn "Could not find template #{key}"
        false
      end
    end

    def uninstall
      FileUtils.mv(target+ ".backup", target)
      puts "Uninstalled git-log-time"
      true
    end

  private

    def templates
      return @templates if @templates
      pattern = File.join(TEMPLATE_DIR, "*")

      @templates =
      Dir.glob(pattern).inject({}) do |hash, file|
        key = file.match(/\/([^\/]+?)$/)[1]
        hash[key] = file
        hash
      end
    end

  end
end
