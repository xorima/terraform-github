provider "github" {
  owner   = "Xorima"
  token   = var.github_token
  version = "= 3.0" # 3.1.0 has a breaking change, https://github.com/terraform-providers/terraform-provider-github/issues/566
}

provider "github" {
  alias   = "xorimabot"
  token   = var.xorimabot_github_token
  version = "= 3.0" # 3.1.0 has a breaking change, https://github.com/terraform-providers/terraform-provider-github/issues/566
}

locals {
  label_validator_config = {
    docker_username = var.docker_username
    docker_password = var.docker_password
    enabled         = true
  }
}
