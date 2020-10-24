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

variable "label_validator_url" {}
variable "webhook_secret_key" {}

locals {
  label_validator_config = {
    url     = var.label_validator_url
    secret  = var.webhook_secret_key
    enabled = true
  }
}

variable "json_version_bumper_url" {}

locals {
  json_version_bumper_config = {
    url     = var.json_version_bumper_url
    secret  = var.webhook_secret_key
    enabled = true
  }
}

variable "release_creator_url" {}

locals {
  release_creator_config = {
    url     = var.release_creator_url
    secret  = var.webhook_secret_key
    enabled = true
  }
}
