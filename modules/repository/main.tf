provider "github" {
  alias "collaborator"
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
  auto_init              = var.auto_init

}

resource "github_repository_collaborator" "xorimabot" {
  repository = var.name
  username   = "xorimabot"
}


resource "github_user_invitation_accepter" "xorimabot" {
  provider      = "github.collaborator"
  invitation_id = github_repository_collaborator.xorimabot.invitation_id
}
