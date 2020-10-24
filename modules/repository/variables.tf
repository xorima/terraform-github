variable "name" {
  description = "Name of Repository"
}
variable "description" {
  description = "Repository Description"
}

variable "label_validator_config" {
  default = {
    enabled = false
  }
}