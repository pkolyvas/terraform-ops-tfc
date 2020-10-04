resource "tfe_workspace" "workspaces" {
  for_each = var.workspaces

  name         = each.key
  organization = var.organization_name

  operations        = each.value["operations"]
  terraform_version = each.value["terraform_version"]
  queue_all_runs    = each.value["queue_all_runs"]
  working_directory = each.value["working_directory"]
  vcs_repo {
    identifier     = each.value["vcs_identifier"]
    branch         = each.value["vcs_branch"]
    oauth_token_id = each.value["vcs_oauth_token_id"]
  }
}
