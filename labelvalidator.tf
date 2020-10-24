module "labelvalidator" {
  source           = "./modules/repository"
  name             = "labelvalidator"
  description      = "Ruby webapp to check that github prs have release labels"
  dockerhub_config = local.dockerhub_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}
