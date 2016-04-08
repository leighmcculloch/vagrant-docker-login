require "pathname"

module VagrantPlugins
  module DockerLoginProvisioner
    class DockerLogin
      def initialize(machine, config)
        @machine = machine
        @config = config
      end

      def login
        @machine.ui.detail(I18n.t(:docker_login_logging_in, server: @config.server))
        @machine.communicate.tap do |comm|
          components = []
          components << "docker login"
          components << "--username=\"#{@config.username}\"" if @config.username
          components << "--email=\"#{@config.email}\"" if @config.email
          components << "--password=\"#{@config.password}\"" if @config.password
          components << "#{@config.server}" if @config.server
          command = components.join(" ")
          comm.sudo(command) do |type, data|
            handle_comm(type, data)
          end
        end
      end

      protected

      def handle_comm(type, data)
        data.chomp!
        return if data.empty?
        case type
        when :stdout; @machine.ui.detail(data)
        when :stderr; @machine.ui.error(data)
        end
      end
    end
  end
end
