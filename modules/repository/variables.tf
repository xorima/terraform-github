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