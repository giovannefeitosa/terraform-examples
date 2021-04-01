# Documentation about docker provider
# https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs

# Set the required provider and versions
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

# Configure the docker provider
provider "docker" {
}

# Create a docker image resource
# -> docker pull nginx:latest
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

# Create a docker container resource
# -> same as 'docker run --name nginx -d nginx:latest'
resource "docker_container" "nginx" {
  name    = "nginx"
  image   = docker_image.nginx.latest
  ports {
    internal = 80
    external = 10123
  }
}
