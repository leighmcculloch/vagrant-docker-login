module VagrantPlugins
  module DockerLoginProvisioner
    class Config < Vagrant.plugin("2", :config)
      attr_accessor :username, :email, :password, :server

      def initialize
        @username = UNSET_VALUE
        @email = UNSET_VALUE
        @password = UNSET_VALUE
        @server = UNSET_VALUE
      end

      def finalize!
        @username = ENV["DOCKER_USERNAME"] if @username == UNSET_VALUE
        @email = ENV["DOCKER_EMAIL"] if @email == UNSET_VALUE
        @password = ENV["DOCKER_PASSWORD"] if @password == UNSET_VALUE
        @server = ENV["DOCKER_SERVER"] if @server == UNSET_VALUE
      end
    end
  end
end
