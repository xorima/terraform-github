# terraform-github

For managing all my repositories in a sane manner

## Adding a repo

Create a file called `repository.tf` where repository is the name of your repository e.g. `foodcritic.tf`

consume the module and decide which webhooks are required

## Importing a repository

Note: Requires admin rights
Create the terraform file for the repository
import the state file using:

```bash
terraform import module.memcached.github_repository.repository memcached
```

Then get the PR merged in, not merging in the PR will result in terraform deleting the repo on next run ...
