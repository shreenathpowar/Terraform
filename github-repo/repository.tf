resource "github_repository" "repo_first_using_terraform" {
  name        = "first-repo-using-terraform"
  description = "First GitHub Repo using Terraform"

  visibility = "public"
  auto_init = true
}
