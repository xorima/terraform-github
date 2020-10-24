module "changelogreset" {
  source                     = "./modules/repository"
  name                       = "changelogreset"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  description                = "Reset a changelog back to ## Unreleased from a github release webhook event"
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}
