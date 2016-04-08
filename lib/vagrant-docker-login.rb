require "pathname"

require "vagrant-docker-login/plugin"

module VagrantPlugins
  module DockerLoginProvisioner
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path("../../", __FILE__))
    end
  end
end
