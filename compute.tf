
resource "linode_instance" "github_runner" {
  image     = "linode/ubuntu22.04"
  region    = "nl-ams"
  type      = "g6-nanode-1"
  label     = "github-runner"
  root_pass = var.root_password  # Set the root password

  metadata {
    user_data = base64encode(templatefile("./linode.yaml.tpl", {
      githubpat = var.github_pat
      githubuser = var.github_username
      githubrepo = var.github_repo
    }))
  }

}


