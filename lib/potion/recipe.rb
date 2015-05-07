module Potion
  class Recipe
    attr_reader :git, :github, :ref, :submodule, :project_name
    def initialize(args)
      @git    = args.fetch(:git, nil)
      @github = args.fetch(:github, nil)
      @ref    = args.fetch(:ref, nil)
      @submodule = args.fetch(:submodule, nil)
      @project_name = args.fetch(:name, @github.split('/').last)
    end

    def load!
      get_project unless exists?(directory)
      get_submodule if submodule
    end

    def create_potion_dirs
      ::FileUtils.mkdir_p("#{base_path}/#{Potion::POTION_SUBFOLDER}")
      ::FileUtils.mkdir_p("#{base_path}/#{Potion::POTION_STORE_PATH}")
    end

    def link_version
      latest_link = "#{base_path}/#{Potion::POTION_SUBFOLDER}/#{project_name}"
      cmd = "rm -f #{latest_link} && "
      cmd += "ln -s #{base_path}/#{Potion::POTION_STORE_PATH}/#{project_name}/#{ref} #{latest_link}"
      %x[ #{cmd} ]
    end

    def cleanup

    end

  private

    def get_uri
      return "git@github.com:#{github}.git" if github
      git
    end

    def base_path
      Dir.pwd
    end

    def directory
      "#{base_path}/#{Potion::POTION_STORE_PATH}/#{project_name}/#{ref}"
    end

    def exists?(path)
      File.exists? File.expand_path(path)
    end

    def get_project
      cmd = "git clone #{get_uri} #{directory}"
      cmd += "&& cd #{directory} && git checkout #{ref}" unless ref.nil?
      %x[ #{cmd} ]
    end

    def get_submodule
      puts "Retrieving Submodule"
      cmd = "cd #{directory} && git submodule init && git submodule update"
      %x[ #{cmd} ]
    end

  end
end
