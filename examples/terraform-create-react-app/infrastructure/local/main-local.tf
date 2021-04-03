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
resource "docker_image" "react-image" {
  name = "react_image"
  keep_locally = false
  force_remove = true

  build {
    # ! Restriction !
    # 
    # This path will be the docker context
    # The paths on Dockerfile should
    # be relative to this path
    # 
    # Is not possible to use Dockerfile outside
    # context
    path = "../../"
    dockerfile = "./infrastructure/local/Dockerfile"
  }
}

# Create a docker container resource
resource "docker_container" "react-container" {
  name    = "react_container"
  image   = docker_image.react-image.latest

  # Expose container port
  # So you can access http://localhost:10124
  ports {
    internal = 3000
    external = 10124
  }

  # Add this volume for hot reload
  volumes {
    container_path = "/app/src"
    host_path = abspath("../../react/src")
  }

  # Add this volume for hot reload
  volumes {
    container_path = "/app/public"
    host_path = abspath("../../react/public")
  }
}
