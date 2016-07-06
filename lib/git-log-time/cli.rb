require 'fileutils'
require 'git-log-time/installer'

module GitLogTime

  TemplateNotFound = Class.new(StandardError)

  class Cli

    def initialize(*args)
      @args = args
    end

    def execute()
      action_name = @args.shift or 'help'
      action = :"execute_#{action_name}"
      if respond_to?(action)
      then send(action, *@args)
      else execute_help(action_name, *@args)
      end
    end

    def execute_help(*args)
      warn "Usage: git-log-time install"
      warn "Usage: git-log-time uninstall"
      args.empty? # return status, it's ok if user requested help
    end

    def execute_install(key = nil, *args)
      ['post-commit', 'pre-push' ].each do |key|
        GitLogTime::Installer.new(key).install
      end
    end

    def execute_uninstall(key = nil, *args)
      ['post-commit', 'pre-push' ].each do |key|
        GitLogTime::Installer.new(key).uninstall
      end
    end

    def execute_new(*args)
      GitLogTime::Template.new(*args).save
    rescue ArgumentError => e
      warn e
      warn "Usage: git-log-time new plugin-name 'Author Name' author@email 'description of the plugin'"
    end

    def config
      @config ||= GitLogTime::Configuration.new(GitLogTime.pluginator)
    end

    def list_evaluator
      @list_evaluator ||= GitLogTime::ListEvaluator.new(config)
    end

  end
end
