variable "name" {
  description = "Name of Repository"
}
variable "description" {
  description = "Repository Description"
}

variable "dockerhub_config" {
  default = {
    enabled = false
  }
}

variable "label_validator_config" {
  default = {
    enabled = false
  }
}

variable "json_version_bumper_config" {
  default = {
    enabled = false
  }
}

variable "release_creator_config" {
  default = {
    enabled = false
  }
}