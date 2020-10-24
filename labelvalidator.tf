module "labelvalidator" {
  source                     = "./modules/repository"
  name                       = "labelvalidator"
  description                = "Ruby webapp to check that github prs have release labels"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  # release_creator_config = release_creator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}
