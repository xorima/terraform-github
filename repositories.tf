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

module "labelvalidator" {
  source                     = "./modules/repository"
  name                       = "labelvalidator"
  description                = "Ruby webapp to check that github prs have release labels"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "json_version_bumper" {
  source                     = "./modules/repository"
  name                       = "json_version_bumper"
  description                = "A small app to bump json files with application versions"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}


module "release_creator" {
  source                     = "./modules/repository"
  name                       = "release_creator"
  description                = "Consumes github webhooks and creates releases from tags and changelog. Comments on the merged PR with the new version number"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}


module "github-label-manager" {
  source                     = "./modules/repository"
  name                       = "github-label-manager"
  description                = "A Label Manager for Github relying on Topics and a source repository for Definition files"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}

module "github-cookstyle-runner" {
  source                     = "./modules/repository"
  name                       = "github-cookstyle-runner"
  description                = "A kubernetes application to automatically run cookstyle against repos found by a github topic"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}


module "github-file-manager" {
  source                     = "./modules/repository"
  name                       = "github-file-manager"
  description                = "A File Manager for multiple Github Repositories written in Powershell"
  dockerhub_config           = local.dockerhub_config
  label_validator_config     = local.label_validator_config
  json_version_bumper_config = local.json_version_bumper_config
  release_creator_config     = local.release_creator_config
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}
