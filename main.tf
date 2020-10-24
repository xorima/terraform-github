provider "github" {
  owner = "Xorima"
  token = var.github_token
  version = "= 3.0" # 3.1.0 has a breaking change, https://github.com/terraform-providers/terraform-provider-github/issues/566
}

provider "github" {
  alias = "xorimabot"
  token = var.xorimabot_github_token
  version = "= 3.0" # 3.1.0 has a breaking change, https://github.com/terraform-providers/terraform-provider-github/issues/566
}