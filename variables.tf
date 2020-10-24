variable "github_token" {
}
variable "xorimabot_github_token" {
  description = "Github token for bot account"
}

variable "docker_username" {
}
variable "docker_password" {
}
locals {
  dockerhub_config = {
    username = var.docker_username
    password = var.docker_password
    enabled  = true
  }
}
