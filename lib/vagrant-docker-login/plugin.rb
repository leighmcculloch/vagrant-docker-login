module VagrantPlugins
  module DockerLoginProvisioner
    class Plugin < Vagrant.plugin("2")
      name "docker-login-provisioner"
      description <<-DESC
      Provides support for provisioning your virtual machines that run Docker, by logging them into a Docker repository automatically.
      DESC

      I18n.load_path << File.expand_path("../locales/en.yml", __FILE__)
      I18n.reload!

      config(:docker_login, :provisioner) do
        require_relative "config"
        Config
      end

      provisioner(:docker_login) do
        require_relative "provisioner"
        Provisioner
      end
    end
  end
end
