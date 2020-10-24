provider "github" {
  alias = "collaborator"
}

resource "github_repository" "repository" {
  name        = var.name
  description = var.description

  visibility             = "public"
  has_issues             = true
  has_wiki               = false
  has_projects           = false
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  has_downloads          = false
  auto_init              = true

}

resource "github_repository_collaborator" "xorimabot" {
  repository = github_repository.repository.name
  username   = "xorimabot"
}


resource "github_user_invitation_accepter" "xorimabot" {
  provider      = github.collaborator
  invitation_id = github_repository_collaborator.xorimabot.invitation_id
}

resource "github_actions_secret" "docker_username" {
  repository      = github_repository.repository.name
  secret_name     = "DOCKER_USERNAME"
  plaintext_value = var.dockerhub_config.username
  count           = var.dockerhub_config.enabled ? 1 : 0
}
resource "github_actions_secret" "docker_password" {
  repository      = github_repository.repository.name
  secret_name     = "DOCKER_PASSWORD"
  plaintext_value = var.dockerhub_config.password
  count           = var.dockerhub_config.enabled ? 1 : 0
}

resource "github_repository_webhook" "label_validator" {
  repository = github_repository.repository.name
  count      = var.label_validator_config.enabled ? 1 : 0

  configuration {
    url          = var.label_validator_config.url
    content_type = "form"
    insecure_ssl = false
    secret       = var.label_validator_config.secret
  }

  active = true

  events = ["pull_request"]
}

resource "github_issue_label" "release_major" {
  count      = var.label_validator_config.enabled ? 1 : 0
  repository = github_repository.repository.name
  name       = "Release: Major"
  color      = "FFC0CB"
}
resource "github_issue_label" "release_minor" {
  count      = var.label_validator_config.enabled ? 1 : 0
  repository = github_repository.repository.name
  name       = "Release: Minor"
  color      = "FF69B4"
}
resource "github_issue_label" "release_patch" {
  count      = var.label_validator_config.enabled ? 1 : 0
  repository = github_repository.repository.name
  name       = "Release: Patch"
  color      = "FFB6C1"
}

resource "github_repository_webhook" "json_version_bumper" {
  repository = github_repository.repository.name
  count      = var.json_version_bumper_config.enabled ? 1 : 0

  configuration {
    url          = var.json_version_bumper_config.url
    content_type = "form"
    insecure_ssl = false
    secret       = var.json_version_bumper_config.secret
  }

  active = true

  events = ["releases"]
}

resource "github_repository_webhook" "release_creator" {
  repository = github_repository.repository.name
  count      = var.release_creator_config.enabled ? 1 : 0

  configuration {
    url          = var.release_creator_config.url
    content_type = "form"
    insecure_ssl = false
    secret       = var.release_creator_config.secret
  }

  active = true

  events = ["pull_request"]
}