# Vagrant Provisioner: Docker Login

A Vagrant provisioner for [Docker's login command](https://docs.docker.com/engine/reference/commandline/login/). Login to a Docker repository automatically.

## Install

```bash
vagrant plugin install vagrant-docker-login
```

## Usage

### Install docker and login configured with environment variables

Define environment variables:
* `DOCKER_USERNAME` required
* `DOCKER_EMAIL` required
* `DOCKER_PASSWORD` required
* `DOCKER_SERVER` optional, will use the main Docker registry if not set

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/wily64"

  config.vm.provision :docker
  config.vm.provision :docker_login
end
```

### Install docker and login with credentials and to server provided in Vagrantfile

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/wily64"

  config.vm.provision :docker
  config.vm.provision :docker_login, username: "username", email: "email@example.com", password: "password", server: "localhost:8080"
end
```

## Example

See `example` in the repository for a full working example.
