# This resource will generate and manage as many workspaces
# as are defined as objects for the workspaces map.
# The dynamic vcs_repo block will be populated only if the nested
# vcs_repo object is defined. There's still a bit of work to do here
# on further streamlining the optional attributes within the dynamic
# block but I ran out of time.
resource "tfe_workspace" "workspaces" {
  for_each = var.workspaces

  name         = each.key
  organization = var.organization_name

  terraform_version = each.value["terraform_version"]
  queue_all_runs    = each.value["queue_all_runs"]
  execution_mode    = each.value["execution_mode"]
  working_directory = each.value["working_directory"] 
  dynamic "vcs_repo" {
    for_each = each.value.vcs_repo.*
    content {
      identifier     = vcs_repo.value["identifier"]
      oauth_token_id = vcs_repo.value["oauth_token_id"]
      branch         = vcs_repo.value["branch"]
    }
  }
}

# These two resources will create the required AWS env vars
# for each workspace in the workspaces map of objects. 
resource "tfe_variable" "aws_key" {
  for_each = var.workspaces

  workspace_id = tfe_workspace.workspaces[each.key].id
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.AWS_ACCESS_KEY_ID
  category     = "env"
  sensitive    = true
}

resource "tfe_variable" "aws_secret" {
  for_each = var.workspaces

  workspace_id = tfe_workspace.workspaces[each.key].id
  key          = "AWS_SECRET_KEY"
  value        = var.AWS_SECRET_ACCESS_KEY
  category     = "env"
  sensitive    = true
}