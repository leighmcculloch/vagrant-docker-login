require_relative "docker_login"

module VagrantPlugins
  module DockerLoginProvisioner
    class Provisioner < Vagrant.plugin("2", :provisioner)
      def initialize(machine, config, docker_login = nil)
        super(machine, config)

        @docker_login = docker_login || DockerLogin.new(@machine, @config)
      end

      def provision
        @docker_login.login
      end
    end
  end
end
