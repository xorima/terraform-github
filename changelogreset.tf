module "changelogreset" {
  source      = "./modules/repository"
  name        = "changelogreset"
  description = "Reset a changelog back to ## Unreleased from a github release webhook event"
  providers = {
    github              = github
    github.collaborator = github.xorimabot
  }
}
