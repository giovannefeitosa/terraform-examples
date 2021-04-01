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
resource "docker_image" "react-image" {
  name = "react_image"
  keep_locally = false
  force_remove = true

  build {
    path = "../../"
    dockerfile = "./infrastructure/local/Dockerfile"
  }
}

# Create a docker container resource
# -> same as 'docker run --name nginx -d nginx:latest'
resource "docker_container" "react-container" {
  name    = "react_container"
  image   = docker_image.react-image.latest
  ports {
    internal = 3000
    external = 10124
  }
}
