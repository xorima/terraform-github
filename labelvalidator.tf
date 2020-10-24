module "labelvalidator" {
  source                 = "./modules/repository"
  name                   = "labelvalidator"
  description            = "Ruby webapp to check that github prs have release labels"
  label_validator_config = local.label_validator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}
